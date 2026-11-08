// Recorre el reglamento y La Nube y guarda un Markdown por página con su metadata.
const fs=require('fs');const path=require('path');const {chromium}=require('playwright');const {extraer}=require('./extraer');
const SALIDA=process.argv[2]; const HOY=new Date().toISOString().slice(0,10);
const espera=ms=>new Promise(r=>setTimeout(r,ms));
const CAT_NUBE={ // página de La Nube → categoría de PEA
  'tuprimersemestre':'institucional','teacompa%C3%B1amos':'atencion-y-derivaciones','portal-de-estudiantes':'plataformas',
  'inscripci%C3%B3n-a-materias':'aranceles-y-pagos','aula-virtual':'plataformas','calendario-academico':'tramites','ebook-21':'plataformas',
  'app-siglo-21':'plataformas','klarway':'plataformas','gabinete-de-bienestar-1':'atencion-y-derivaciones','encuentros-con-directores':'atencion-y-derivaciones',
  'tutoresvirtuales':'atencion-y-derivaciones','universitarios21':'oferta-academica','simulador-de-condicion':'tramites',
  'modalidad-presencial':'modalidades','modalidad-presencial-home':'modalidades','modalidad-edh':'modalidades','modalidad-ed':'modalidades',
  'presencialidad-distribuida':'modalidades','equivalencias':'tramites','trabajos-practicos':'tramites','efip':'tramites','tipos-de-materias':'oferta-academica',
  'correlativas':'tramites','materias-electivas':'oferta-academica','practica-solidaria':'oferta-academica','practica-profesional':'oferta-academica',
  'seminariofinal':'tramites','cae':'tramites','becas-y-beneficios':'aranceles-y-pagos','idiomas':'oferta-academica','posgrado-virtual':'oferta-academica',
  'posgrado-presencial':'oferta-academica','aprendizaje-para-la-vida':'oferta-academica','ce-emprendimiento-innovacion':'institucional',
  'internacionalizacion':'institucional','empleabilidad':'institucional','desarrollo-y-prop%C3%B3sito':'institucional','actividades-disciplinares':'institucional',
  'sustentabilidad-social':'institucional','investigacion':'institucional','arte-y-cultura':'institucional','salud-y-deportes':'institucional',
  'ayudantias':'institucional','comunidad-net':'institucional','egresados':'institucional','proceso-de-titulacion':'tramites','colaciones-2026':'tramites',
  'canales-de-contacto':'atencion-y-derivaciones','reglamento':'reglamento'};
function limpiar(md){
  return md.split('\n').filter(l=>!/^(Ver más|Ver m[aá]s|​|​|Leer más|Ingresá acá >?)$/i.test(l.trim()))
    .map(l=>{const m=/^(#+) (.*)$/.exec(l);return m&&m[2].length>110?m[2]:l;}) // párrafos de Wix marcados como títulos
    .join('\n').replace(/\n{3,}/g,'\n\n').trim();
}
function frente(o){return '---\n'+Object.entries(o).map(([k,v])=>`${k}: ${JSON.stringify(v)}`).join('\n')+'\n---\n\n';}
(async()=>{
  const b=await chromium.launch();const p=await (await b.newContext({viewport:{width:1440,height:900}})).newPage();
  const indice=[];
  // Reglamento
  await p.goto('https://contenidos.21.edu.ar/microsites/reglamento/',{waitUntil:'networkidle'});
  const secciones=await p.evaluate(()=>[...new Map([...document.querySelectorAll('a[href*="index.php?put="]')].filter(a=>a.innerText.trim()).map(a=>[a.href,a.innerText.trim()])).entries()]);
  fs.mkdirSync(path.join(SALIDA,'reglamento'),{recursive:true});
  for(const [url,titulo] of secciones){
    const slug=new URL(url).searchParams.get('put');
    if(indice.some(x=>x.slug===slug))continue;
    try{const md=limpiar(await extraer(p,url,'main'));
      const cap=+slug.split('-')[0];
      fs.writeFileSync(path.join(SALIDA,'reglamento',slug+'.md'),frente({titulo,fuente:url,extraido:HOY,categoria:'reglamento',capitulo:cap,estado:'a validar'})+md+'\n');
      indice.push({sitio:'reglamento',slug,titulo,url,categoria:'reglamento',chars:md.length});console.log('ok',slug,md.length);
    }catch(e){console.log('ERROR',url,e.message);}
    await espera(700);
  }
  // La Nube
  fs.mkdirSync(path.join(SALIDA,'lanube'),{recursive:true});
  for(const [clave,cat] of Object.entries(CAT_NUBE)){
    if(clave==='reglamento')continue;
    const url='https://www.lanube.21.edu.ar/'+clave;
    try{const md=limpiar(await extraer(p,url,'#PAGES_CONTAINER'));
      const titulo=(await p.title()).replace(/\s*\|\s*Siglo 21 - La Nube\s*$/,'').trim();
      const slug=decodeURIComponent(clave).normalize('NFD').replace(/\p{Diacritic}/gu,'').replace(/[^a-z0-9-]/gi,'-').toLowerCase();
      fs.writeFileSync(path.join(SALIDA,'lanube',slug+'.md'),frente({titulo,fuente:url,extraido:HOY,categoria:cat,estado:'a validar'})+md+'\n');
      indice.push({sitio:'lanube',slug,titulo,url,categoria:cat,chars:md.length});console.log('ok',slug,md.length);
    }catch(e){console.log('ERROR',url,e.message);}
    await espera(700);
  }
  fs.writeFileSync(path.join(SALIDA,'indice.json'),JSON.stringify(indice,null,1));
  await b.close();
})();
