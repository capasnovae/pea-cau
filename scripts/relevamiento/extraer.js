// uso: node extraer.js <url> [selector]  → imprime Markdown del contenido principal
const {chromium}=require('playwright');
async function extraer(p, url, selector){
  await p.goto(url,{waitUntil:'networkidle',timeout:90000});
  await p.waitForTimeout(800);
  return p.evaluate((sel)=>{
    const raiz=document.querySelector(sel)||document.querySelector('main')||document.body;
    const salida=[]; const visto=new Set();
    const limpio=t=>t.replace(/ /g,' ').replace(/[ \t]+/g,' ').trim();
    const inline=el=>{let s='';for(const n of el.childNodes){if(n.nodeType===3)s+=n.textContent;else if(n.nodeType===1){const t=n.tagName;if(t==='BR')s+='\n';else if(t==='STRONG'||t==='B')s+='**'+limpio(n.innerText)+'**';else if(t==='A'&&n.href&&!n.href.startsWith('javascript')){const tx=limpio(n.innerText);s+=tx?`[${tx}](${n.href})`:'';}else s+=inline(n);}}return s;};
    const visible=el=>{const cs=getComputedStyle(el);return cs.display!=='none'&&cs.visibility!=='hidden';};
    const recorrer=el=>{
      if(!(el instanceof Element)||!visible(el))return;
      const t=el.tagName;
      if(['SCRIPT','STYLE','NAV','HEADER','FOOTER','NOSCRIPT','SVG','BUTTON','FORM','IFRAME'].includes(t))return;
      if(/^H[1-6]$/.test(t)){const tx=limpio(el.innerText);if(tx&&!visto.has(t+tx)){visto.add(t+tx);salida.push('\n'+'#'.repeat(Math.min(+t[1]+1,4))+' '+tx+'\n');}return;}
      if(t==='P'){const tx=limpio(inline(el));if(tx)salida.push(tx+'\n');return;}
      if(t==='LI'){const tx=limpio(inline(el));if(tx)salida.push('- '+tx.replace(/\n+/g,' '));return;}
      if(t==='TABLE'){const filas=[...el.querySelectorAll('tr')].map(r=>[...r.children].map(c=>limpio(c.innerText).replace(/\|/g,'/').replace(/\n+/g,' ')));if(filas.length){const n=Math.max(...filas.map(f=>f.length));const f=filas.map(x=>{while(x.length<n)x.push('');return '| '+x.join(' | ')+' |';});f.splice(1,0,'|'+' --- |'.repeat(n));salida.push('\n'+f.join('\n')+'\n');}return;}
      if(t==='UL'||t==='OL'){for(const c of el.children)recorrer(c);salida.push('');return;}
      // texto suelto en divs sin p (Wix)
      const hijosElem=[...el.children];
      const textoPropio=[...el.childNodes].filter(n=>n.nodeType===3).map(n=>n.textContent).join('').trim();
      if(textoPropio&&hijosElem.every(h=>['SPAN','STRONG','B','EM','I','A','BR'].includes(h.tagName))){const tx=limpio(inline(el));if(tx)salida.push(tx+'\n');return;}
      for(const c of hijosElem)recorrer(c);
    };
    recorrer(raiz);
    return salida.join('\n').replace(/\n{3,}/g,'\n\n').trim();
  }, selector);
}
module.exports={extraer};
if(require.main===module){(async()=>{const b=await chromium.launch();const p=await b.newPage();console.log(await extraer(p,process.argv[2],process.argv[3]||'main'));await b.close();})();}
