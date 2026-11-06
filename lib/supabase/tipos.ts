export type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[];

export type Database = {
  graphql_public: {
    Tables: {
      [_ in never]: never;
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      graphql: {
        Args: { extensions?: Json; operationName?: string; query?: string; variables?: Json };
        Returns: Json;
      };
    };
    Enums: {
      [_ in never]: never;
    };
    CompositeTypes: {
      [_ in never]: never;
    };
  };
  public: {
    Tables: {
      areas_derivacion: {
        Row: {
          canal_contacto: string;
          created_at: string;
          id: string;
          nombre: string;
          orden: number;
          plazo_esperado: string;
          que_no_resuelve_md: string;
          que_resuelve_md: string;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          canal_contacto?: string;
          created_at?: string;
          id?: string;
          nombre: string;
          orden?: number;
          plazo_esperado?: string;
          que_no_resuelve_md?: string;
          que_resuelve_md?: string;
          updated_at?: string;
        };
        Update: {
          canal_contacto?: string;
          created_at?: string;
          id?: string;
          nombre?: string;
          orden?: number;
          plazo_esperado?: string;
          que_no_resuelve_md?: string;
          que_resuelve_md?: string;
          updated_at?: string;
        };
        Relationships: [];
      };
      articulo_versiones: {
        Row: {
          articulo_id: string;
          autor_id: string | null;
          created_at: string;
          cuerpo_md: string;
          id: string;
          resumen_cambio: string | null;
          titulo: string;
          version: number;
        };
        ComputedFields: never;
        Insert: {
          articulo_id: string;
          autor_id?: string | null;
          created_at?: string;
          cuerpo_md: string;
          id?: string;
          resumen_cambio?: string | null;
          titulo: string;
          version: number;
        };
        Update: {
          articulo_id?: string;
          autor_id?: string | null;
          created_at?: string;
          cuerpo_md?: string;
          id?: string;
          resumen_cambio?: string | null;
          titulo?: string;
          version?: number;
        };
        Relationships: [
          {
            foreignKeyName: "articulo_versiones_articulo_id_fkey";
            columns: ["articulo_id"];
            isOneToOne: false;
            referencedRelation: "articulos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "articulo_versiones_autor_id_fkey";
            columns: ["autor_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
        ];
      };
      articulos: {
        Row: {
          alcance: Database["public"]["Enums"]["alcance"];
          autor_id: string | null;
          busqueda: unknown;
          categoria_id: string;
          created_at: string;
          cuerpo_md: string;
          estado: Database["public"]["Enums"]["estado_contenido"];
          fuente_url: string | null;
          id: string;
          orden: number;
          padre_id: string | null;
          promovido_at: string | null;
          promovido_por: string | null;
          resumen: string;
          sede_id: string | null;
          sede_origen_id: string | null;
          slug: string;
          titulo: string;
          ultimo_cambio: string | null;
          updated_at: string;
          version: number;
          vigente_desde: string | null;
          vigente_hasta: string | null;
        };
        ComputedFields: never;
        Insert: {
          alcance?: Database["public"]["Enums"]["alcance"];
          autor_id?: string | null;
          busqueda?: never;
          categoria_id: string;
          created_at?: string;
          cuerpo_md?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          fuente_url?: string | null;
          id?: string;
          orden?: number;
          padre_id?: string | null;
          promovido_at?: string | null;
          promovido_por?: string | null;
          resumen?: string;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          slug: string;
          titulo: string;
          ultimo_cambio?: string | null;
          updated_at?: string;
          version?: number;
          vigente_desde?: string | null;
          vigente_hasta?: string | null;
        };
        Update: {
          alcance?: Database["public"]["Enums"]["alcance"];
          autor_id?: string | null;
          busqueda?: never;
          categoria_id?: string;
          created_at?: string;
          cuerpo_md?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          fuente_url?: string | null;
          id?: string;
          orden?: number;
          padre_id?: string | null;
          promovido_at?: string | null;
          promovido_por?: string | null;
          resumen?: string;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          slug?: string;
          titulo?: string;
          ultimo_cambio?: string | null;
          updated_at?: string;
          version?: number;
          vigente_desde?: string | null;
          vigente_hasta?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "articulos_autor_id_fkey";
            columns: ["autor_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "articulos_categoria_id_fkey";
            columns: ["categoria_id"];
            isOneToOne: false;
            referencedRelation: "categorias";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "articulos_padre_id_fkey";
            columns: ["padre_id"];
            isOneToOne: false;
            referencedRelation: "articulos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "articulos_promovido_por_fkey";
            columns: ["promovido_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "articulos_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "articulos_sede_origen_id_fkey";
            columns: ["sede_origen_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      auditoria: {
        Row: {
          accion: string;
          actor_id: string | null;
          created_at: string;
          datos: NonNullable<Json>;
          entidad: string;
          entidad_id: string | null;
          id: string;
        };
        ComputedFields: never;
        Insert: {
          accion: string;
          actor_id?: string | null;
          created_at?: string;
          datos?: NonNullable<Json>;
          entidad: string;
          entidad_id?: string | null;
          id?: string;
        };
        Update: {
          accion?: string;
          actor_id?: string | null;
          created_at?: string;
          datos?: NonNullable<Json>;
          entidad?: string;
          entidad_id?: string | null;
          id?: string;
        };
        Relationships: [];
      };
      campanas: {
        Row: {
          alcance: Database["public"]["Enums"]["alcance"];
          autor_id: string | null;
          created_at: string;
          descripcion_md: string;
          estado: Database["public"]["Enums"]["estado_contenido"];
          id: string;
          nombre: string;
          promovido_at: string | null;
          promovido_por: string | null;
          sede_id: string | null;
          sede_origen_id: string | null;
          updated_at: string;
          vigente_desde: string | null;
          vigente_hasta: string | null;
        };
        ComputedFields: never;
        Insert: {
          alcance?: Database["public"]["Enums"]["alcance"];
          autor_id?: string | null;
          created_at?: string;
          descripcion_md?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          id?: string;
          nombre: string;
          promovido_at?: string | null;
          promovido_por?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          updated_at?: string;
          vigente_desde?: string | null;
          vigente_hasta?: string | null;
        };
        Update: {
          alcance?: Database["public"]["Enums"]["alcance"];
          autor_id?: string | null;
          created_at?: string;
          descripcion_md?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          id?: string;
          nombre?: string;
          promovido_at?: string | null;
          promovido_por?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          updated_at?: string;
          vigente_desde?: string | null;
          vigente_hasta?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "campanas_autor_id_fkey";
            columns: ["autor_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "campanas_promovido_por_fkey";
            columns: ["promovido_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "campanas_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "campanas_sede_origen_id_fkey";
            columns: ["sede_origen_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      casos: {
        Row: {
          alcance: Database["public"]["Enums"]["alcance"];
          autor_id: string | null;
          categoria_id: string | null;
          contexto_md: string;
          created_at: string;
          estado: Database["public"]["Enums"]["estado_contenido"];
          id: string;
          promovido_at: string | null;
          promovido_por: string | null;
          sede_id: string | null;
          sede_origen_id: string | null;
          titulo: string;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          alcance?: Database["public"]["Enums"]["alcance"];
          autor_id?: string | null;
          categoria_id?: string | null;
          contexto_md?: string;
          created_at?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          id?: string;
          promovido_at?: string | null;
          promovido_por?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          titulo: string;
          updated_at?: string;
        };
        Update: {
          alcance?: Database["public"]["Enums"]["alcance"];
          autor_id?: string | null;
          categoria_id?: string | null;
          contexto_md?: string;
          created_at?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          id?: string;
          promovido_at?: string | null;
          promovido_por?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          titulo?: string;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "casos_autor_id_fkey";
            columns: ["autor_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "casos_categoria_id_fkey";
            columns: ["categoria_id"];
            isOneToOne: false;
            referencedRelation: "categorias";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "casos_promovido_por_fkey";
            columns: ["promovido_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "casos_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "casos_sede_origen_id_fkey";
            columns: ["sede_origen_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      categorias: {
        Row: {
          created_at: string;
          descripcion: string;
          icono: string | null;
          id: string;
          nombre: string;
          orden: number;
          padre_id: string | null;
          slug: string;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          descripcion?: string;
          icono?: string | null;
          id?: string;
          nombre: string;
          orden?: number;
          padre_id?: string | null;
          slug: string;
          updated_at?: string;
        };
        Update: {
          created_at?: string;
          descripcion?: string;
          icono?: string | null;
          id?: string;
          nombre?: string;
          orden?: number;
          padre_id?: string | null;
          slug?: string;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "categorias_padre_id_fkey";
            columns: ["padre_id"];
            isOneToOne: false;
            referencedRelation: "categorias";
            referencedColumns: ["id"];
          },
        ];
      };
      certificaciones: {
        Row: {
          codigo_verificacion: string;
          curso_id: string;
          emitida_at: string;
          estado: Database["public"]["Enums"]["estado_certificacion"];
          id: string;
          intento_id: string | null;
          origen: Database["public"]["Enums"]["origen_certificacion"];
          pdf_path: string | null;
          usuario_id: string;
          vence_at: string | null;
        };
        ComputedFields: never;
        Insert: {
          codigo_verificacion?: string;
          curso_id: string;
          emitida_at?: string;
          estado?: Database["public"]["Enums"]["estado_certificacion"];
          id?: string;
          intento_id?: string | null;
          origen: Database["public"]["Enums"]["origen_certificacion"];
          pdf_path?: string | null;
          usuario_id: string;
          vence_at?: string | null;
        };
        Update: {
          codigo_verificacion?: string;
          curso_id?: string;
          emitida_at?: string;
          estado?: Database["public"]["Enums"]["estado_certificacion"];
          id?: string;
          intento_id?: string | null;
          origen?: Database["public"]["Enums"]["origen_certificacion"];
          pdf_path?: string | null;
          usuario_id?: string;
          vence_at?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "certificaciones_curso_id_fkey";
            columns: ["curso_id"];
            isOneToOne: false;
            referencedRelation: "cursos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "certificaciones_intento_id_fkey";
            columns: ["intento_id"];
            isOneToOne: false;
            referencedRelation: "intentos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "certificaciones_usuario_id_fkey";
            columns: ["usuario_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
        ];
      };
      consigna_asignaciones: {
        Row: {
          comentario: string | null;
          completada_at: string | null;
          consigna_id: string;
          created_at: string;
          estado: Database["public"]["Enums"]["estado_asignacion"];
          evidencia_path: string | null;
          id: string;
          iniciada_at: string | null;
          leida_at: string | null;
          periodo: string;
          updated_at: string;
          usuario_id: string;
          vence_el: string | null;
        };
        ComputedFields: never;
        Insert: {
          comentario?: string | null;
          completada_at?: string | null;
          consigna_id: string;
          created_at?: string;
          estado?: Database["public"]["Enums"]["estado_asignacion"];
          evidencia_path?: string | null;
          id?: string;
          iniciada_at?: string | null;
          leida_at?: string | null;
          periodo: string;
          updated_at?: string;
          usuario_id: string;
          vence_el?: string | null;
        };
        Update: {
          comentario?: string | null;
          completada_at?: string | null;
          consigna_id?: string;
          created_at?: string;
          estado?: Database["public"]["Enums"]["estado_asignacion"];
          evidencia_path?: string | null;
          id?: string;
          iniciada_at?: string | null;
          leida_at?: string | null;
          periodo?: string;
          updated_at?: string;
          usuario_id?: string;
          vence_el?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "consigna_asignaciones_consigna_id_fkey";
            columns: ["consigna_id"];
            isOneToOne: false;
            referencedRelation: "consignas";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "consigna_asignaciones_usuario_id_fkey";
            columns: ["usuario_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
        ];
      };
      consignas: {
        Row: {
          activa: boolean;
          area: Database["public"]["Enums"]["area"] | null;
          articulo_id: string | null;
          creada_por: string;
          created_at: string;
          curso_id: string | null;
          destino: Database["public"]["Enums"]["destino_consigna"];
          destino_equipo_id: string | null;
          destino_subrol_id: string | null;
          destino_usuario_id: string | null;
          detalle_md: string;
          examen_id: string | null;
          fecha_limite: string | null;
          id: string;
          prioridad: Database["public"]["Enums"]["prioridad"];
          recurrencia: Database["public"]["Enums"]["recurrencia"];
          requiere_evidencia: boolean;
          sede_id: string;
          tipo: Database["public"]["Enums"]["tipo_consigna"];
          titulo: string;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          activa?: boolean;
          area?: Database["public"]["Enums"]["area"] | null;
          articulo_id?: string | null;
          creada_por: string;
          created_at?: string;
          curso_id?: string | null;
          destino: Database["public"]["Enums"]["destino_consigna"];
          destino_equipo_id?: string | null;
          destino_subrol_id?: string | null;
          destino_usuario_id?: string | null;
          detalle_md?: string;
          examen_id?: string | null;
          fecha_limite?: string | null;
          id?: string;
          prioridad?: Database["public"]["Enums"]["prioridad"];
          recurrencia?: Database["public"]["Enums"]["recurrencia"];
          requiere_evidencia?: boolean;
          sede_id: string;
          tipo?: Database["public"]["Enums"]["tipo_consigna"];
          titulo: string;
          updated_at?: string;
        };
        Update: {
          activa?: boolean;
          area?: Database["public"]["Enums"]["area"] | null;
          articulo_id?: string | null;
          creada_por?: string;
          created_at?: string;
          curso_id?: string | null;
          destino?: Database["public"]["Enums"]["destino_consigna"];
          destino_equipo_id?: string | null;
          destino_subrol_id?: string | null;
          destino_usuario_id?: string | null;
          detalle_md?: string;
          examen_id?: string | null;
          fecha_limite?: string | null;
          id?: string;
          prioridad?: Database["public"]["Enums"]["prioridad"];
          recurrencia?: Database["public"]["Enums"]["recurrencia"];
          requiere_evidencia?: boolean;
          sede_id?: string;
          tipo?: Database["public"]["Enums"]["tipo_consigna"];
          titulo?: string;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "consignas_articulo_id_fkey";
            columns: ["articulo_id"];
            isOneToOne: false;
            referencedRelation: "articulos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "consignas_creada_por_fkey";
            columns: ["creada_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "consignas_destino_equipo_id_fkey";
            columns: ["destino_equipo_id"];
            isOneToOne: false;
            referencedRelation: "equipos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "consignas_destino_subrol_id_fkey";
            columns: ["destino_subrol_id"];
            isOneToOne: false;
            referencedRelation: "subroles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "consignas_destino_usuario_id_fkey";
            columns: ["destino_usuario_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "consignas_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      conversacion_participantes: {
        Row: {
          archivada: boolean;
          conversacion_id: string;
          leido_at: string | null;
          usuario_id: string;
        };
        ComputedFields: never;
        Insert: {
          archivada?: boolean;
          conversacion_id: string;
          leido_at?: string | null;
          usuario_id: string;
        };
        Update: {
          archivada?: boolean;
          conversacion_id?: string;
          leido_at?: string | null;
          usuario_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "conversacion_participantes_conversacion_id_fkey";
            columns: ["conversacion_id"];
            isOneToOne: false;
            referencedRelation: "conversaciones";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "conversacion_participantes_usuario_id_fkey";
            columns: ["usuario_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
        ];
      };
      conversaciones: {
        Row: {
          asunto: string;
          creada_por: string;
          created_at: string;
          es_anuncio: boolean;
          id: string;
          sede_id: string | null;
          ultimo_mensaje_at: string;
        };
        ComputedFields: never;
        Insert: {
          asunto: string;
          creada_por: string;
          created_at?: string;
          es_anuncio?: boolean;
          id?: string;
          sede_id?: string | null;
          ultimo_mensaje_at?: string;
        };
        Update: {
          asunto?: string;
          creada_por?: string;
          created_at?: string;
          es_anuncio?: boolean;
          id?: string;
          sede_id?: string | null;
          ultimo_mensaje_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "conversaciones_creada_por_fkey";
            columns: ["creada_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "conversaciones_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      cursos: {
        Row: {
          alcance: Database["public"]["Enums"]["alcance"];
          autor_id: string | null;
          created_at: string;
          descripcion_md: string;
          estado: Database["public"]["Enums"]["estado_contenido"];
          id: string;
          nivel_orden: number | null;
          portada_path: string | null;
          promovido_at: string | null;
          promovido_por: string | null;
          sede_id: string | null;
          sede_origen_id: string | null;
          tipo: Database["public"]["Enums"]["tipo_curso"];
          titulo: string;
          updated_at: string;
          vigencia_meses: number | null;
        };
        ComputedFields: never;
        Insert: {
          alcance?: Database["public"]["Enums"]["alcance"];
          autor_id?: string | null;
          created_at?: string;
          descripcion_md?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          id?: string;
          nivel_orden?: number | null;
          portada_path?: string | null;
          promovido_at?: string | null;
          promovido_por?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          tipo: Database["public"]["Enums"]["tipo_curso"];
          titulo: string;
          updated_at?: string;
          vigencia_meses?: number | null;
        };
        Update: {
          alcance?: Database["public"]["Enums"]["alcance"];
          autor_id?: string | null;
          created_at?: string;
          descripcion_md?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          id?: string;
          nivel_orden?: number | null;
          portada_path?: string | null;
          promovido_at?: string | null;
          promovido_por?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          tipo?: Database["public"]["Enums"]["tipo_curso"];
          titulo?: string;
          updated_at?: string;
          vigencia_meses?: number | null;
        };
        Relationships: [
          {
            foreignKeyName: "cursos_autor_id_fkey";
            columns: ["autor_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "cursos_promovido_por_fkey";
            columns: ["promovido_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "cursos_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "cursos_sede_origen_id_fkey";
            columns: ["sede_origen_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      cursos_favoritos: {
        Row: {
          created_at: string;
          curso_id: string;
          usuario_id: string;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          curso_id: string;
          usuario_id?: string;
        };
        Update: {
          created_at?: string;
          curso_id?: string;
          usuario_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "cursos_favoritos_curso_id_fkey";
            columns: ["curso_id"];
            isOneToOne: false;
            referencedRelation: "cursos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "cursos_favoritos_usuario_id_fkey";
            columns: ["usuario_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
        ];
      };
      equipos: {
        Row: {
          area: Database["public"]["Enums"]["area"];
          created_at: string;
          id: string;
          lider_id: string | null;
          nombre: string;
          sede_id: string;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          area: Database["public"]["Enums"]["area"];
          created_at?: string;
          id?: string;
          lider_id?: string | null;
          nombre: string;
          sede_id: string;
          updated_at?: string;
        };
        Update: {
          area?: Database["public"]["Enums"]["area"];
          created_at?: string;
          id?: string;
          lider_id?: string | null;
          nombre?: string;
          sede_id?: string;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "equipos_lider_id_fkey";
            columns: ["lider_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "equipos_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      eventos: {
        Row: {
          creado_por: string | null;
          created_at: string;
          descripcion: string;
          fecha: string;
          hora: string | null;
          id: string;
          sede_id: string | null;
          tipo: Database["public"]["Enums"]["tipo_evento"];
          titulo: string;
        };
        ComputedFields: never;
        Insert: {
          creado_por?: string | null;
          created_at?: string;
          descripcion?: string;
          fecha: string;
          hora?: string | null;
          id?: string;
          sede_id?: string | null;
          tipo?: Database["public"]["Enums"]["tipo_evento"];
          titulo: string;
        };
        Update: {
          creado_por?: string | null;
          created_at?: string;
          descripcion?: string;
          fecha?: string;
          hora?: string | null;
          id?: string;
          sede_id?: string | null;
          tipo?: Database["public"]["Enums"]["tipo_evento"];
          titulo?: string;
        };
        Relationships: [
          {
            foreignKeyName: "eventos_creado_por_fkey";
            columns: ["creado_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "eventos_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      examen_fuentes: {
        Row: {
          cantidad: number | null;
          categoria_id: string | null;
          curso_id: string | null;
          examen_id: string;
          id: string;
          modulo_id: string | null;
        };
        ComputedFields: never;
        Insert: {
          cantidad?: number | null;
          categoria_id?: string | null;
          curso_id?: string | null;
          examen_id: string;
          id?: string;
          modulo_id?: string | null;
        };
        Update: {
          cantidad?: number | null;
          categoria_id?: string | null;
          curso_id?: string | null;
          examen_id?: string;
          id?: string;
          modulo_id?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "examen_fuentes_categoria_id_fkey";
            columns: ["categoria_id"];
            isOneToOne: false;
            referencedRelation: "categorias";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "examen_fuentes_curso_id_fkey";
            columns: ["curso_id"];
            isOneToOne: false;
            referencedRelation: "cursos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "examen_fuentes_examen_id_fkey";
            columns: ["examen_id"];
            isOneToOne: false;
            referencedRelation: "examenes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "examen_fuentes_modulo_id_fkey";
            columns: ["modulo_id"];
            isOneToOne: false;
            referencedRelation: "modulos";
            referencedColumns: ["id"];
          },
        ];
      };
      examenes: {
        Row: {
          alcance: Database["public"]["Enums"]["alcance"];
          autor_id: string | null;
          cantidad_preguntas: number;
          categoria_id: string | null;
          created_at: string;
          curso_id: string | null;
          espera_horas: number;
          estado: Database["public"]["Enums"]["estado_contenido"];
          id: string;
          max_intentos: number;
          mezclar: boolean;
          modulo_id: string | null;
          nota_minima: number;
          promovido_at: string | null;
          promovido_por: string | null;
          sede_id: string | null;
          sede_origen_id: string | null;
          tiempo_limite_min: number | null;
          tipo: Database["public"]["Enums"]["tipo_examen"];
          titulo: string;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          alcance?: Database["public"]["Enums"]["alcance"];
          autor_id?: string | null;
          cantidad_preguntas?: number;
          categoria_id?: string | null;
          created_at?: string;
          curso_id?: string | null;
          espera_horas?: number;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          id?: string;
          max_intentos?: number;
          mezclar?: boolean;
          modulo_id?: string | null;
          nota_minima?: number;
          promovido_at?: string | null;
          promovido_por?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          tiempo_limite_min?: number | null;
          tipo: Database["public"]["Enums"]["tipo_examen"];
          titulo: string;
          updated_at?: string;
        };
        Update: {
          alcance?: Database["public"]["Enums"]["alcance"];
          autor_id?: string | null;
          cantidad_preguntas?: number;
          categoria_id?: string | null;
          created_at?: string;
          curso_id?: string | null;
          espera_horas?: number;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          id?: string;
          max_intentos?: number;
          mezclar?: boolean;
          modulo_id?: string | null;
          nota_minima?: number;
          promovido_at?: string | null;
          promovido_por?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          tiempo_limite_min?: number | null;
          tipo?: Database["public"]["Enums"]["tipo_examen"];
          titulo?: string;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "examenes_autor_id_fkey";
            columns: ["autor_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "examenes_categoria_id_fkey";
            columns: ["categoria_id"];
            isOneToOne: false;
            referencedRelation: "categorias";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "examenes_curso_id_fkey";
            columns: ["curso_id"];
            isOneToOne: false;
            referencedRelation: "cursos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "examenes_modulo_id_fkey";
            columns: ["modulo_id"];
            isOneToOne: false;
            referencedRelation: "modulos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "examenes_promovido_por_fkey";
            columns: ["promovido_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "examenes_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "examenes_sede_origen_id_fkey";
            columns: ["sede_origen_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      intento_preguntas: {
        Row: {
          intento_id: string;
          orden: number;
          orden_opciones: string[];
          pregunta_id: string;
        };
        ComputedFields: never;
        Insert: {
          intento_id: string;
          orden: number;
          orden_opciones?: string[];
          pregunta_id: string;
        };
        Update: {
          intento_id?: string;
          orden?: number;
          orden_opciones?: string[];
          pregunta_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "intento_preguntas_intento_id_fkey";
            columns: ["intento_id"];
            isOneToOne: false;
            referencedRelation: "intentos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "intento_preguntas_pregunta_id_fkey";
            columns: ["pregunta_id"];
            isOneToOne: false;
            referencedRelation: "preguntas";
            referencedColumns: ["id"];
          },
        ];
      };
      intentos: {
        Row: {
          aprobado: boolean | null;
          area: Database["public"]["Enums"]["area"] | null;
          bloque_nivel: number | null;
          cerrado_at: string | null;
          ciclo: number;
          correccion_vence_at: string | null;
          corrector_id: string | null;
          entregado_at: string | null;
          equipo_id: string | null;
          estado: Database["public"]["Enums"]["estado_intento"];
          examen_id: string;
          id: string;
          iniciado_at: string;
          nota: number | null;
          puntaje_auto: number | null;
          puntaje_manual: number | null;
          salidas: number;
          sede_id: string | null;
          tomado_at: string | null;
          usuario_id: string;
          vence_at: string | null;
        };
        ComputedFields: never;
        Insert: {
          aprobado?: boolean | null;
          area?: Database["public"]["Enums"]["area"] | null;
          bloque_nivel?: number | null;
          cerrado_at?: string | null;
          ciclo?: number;
          correccion_vence_at?: string | null;
          corrector_id?: string | null;
          entregado_at?: string | null;
          equipo_id?: string | null;
          estado?: Database["public"]["Enums"]["estado_intento"];
          examen_id: string;
          id?: string;
          iniciado_at?: string;
          nota?: number | null;
          puntaje_auto?: number | null;
          puntaje_manual?: number | null;
          salidas?: number;
          sede_id?: string | null;
          tomado_at?: string | null;
          usuario_id: string;
          vence_at?: string | null;
        };
        Update: {
          aprobado?: boolean | null;
          area?: Database["public"]["Enums"]["area"] | null;
          bloque_nivel?: number | null;
          cerrado_at?: string | null;
          ciclo?: number;
          correccion_vence_at?: string | null;
          corrector_id?: string | null;
          entregado_at?: string | null;
          equipo_id?: string | null;
          estado?: Database["public"]["Enums"]["estado_intento"];
          examen_id?: string;
          id?: string;
          iniciado_at?: string;
          nota?: number | null;
          puntaje_auto?: number | null;
          puntaje_manual?: number | null;
          salidas?: number;
          sede_id?: string | null;
          tomado_at?: string | null;
          usuario_id?: string;
          vence_at?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "intentos_corrector_id_fkey";
            columns: ["corrector_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "intentos_equipo_id_fkey";
            columns: ["equipo_id"];
            isOneToOne: false;
            referencedRelation: "equipos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "intentos_examen_id_fkey";
            columns: ["examen_id"];
            isOneToOne: false;
            referencedRelation: "examenes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "intentos_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "intentos_usuario_id_fkey";
            columns: ["usuario_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
        ];
      };
      item_progreso: {
        Row: {
          created_at: string;
          hecho_at: string | null;
          item_id: string;
          usuario_id: string;
          visto_at: string | null;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          hecho_at?: string | null;
          item_id: string;
          usuario_id: string;
          visto_at?: string | null;
        };
        Update: {
          created_at?: string;
          hecho_at?: string | null;
          item_id?: string;
          usuario_id?: string;
          visto_at?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "item_progreso_item_id_fkey";
            columns: ["item_id"];
            isOneToOne: false;
            referencedRelation: "items";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "item_progreso_usuario_id_fkey";
            columns: ["usuario_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
        ];
      };
      items: {
        Row: {
          articulo_id: string | null;
          contenido_md: string | null;
          created_at: string;
          examen_id: string | null;
          id: string;
          modulo_id: string;
          orden: number;
          recurso_id: string | null;
          requisito: Database["public"]["Enums"]["requisito_item"];
          tipo: Database["public"]["Enums"]["tipo_item"];
          titulo: string;
          updated_at: string;
          url: string | null;
        };
        ComputedFields: never;
        Insert: {
          articulo_id?: string | null;
          contenido_md?: string | null;
          created_at?: string;
          examen_id?: string | null;
          id?: string;
          modulo_id: string;
          orden?: number;
          recurso_id?: string | null;
          requisito?: Database["public"]["Enums"]["requisito_item"];
          tipo: Database["public"]["Enums"]["tipo_item"];
          titulo: string;
          updated_at?: string;
          url?: string | null;
        };
        Update: {
          articulo_id?: string | null;
          contenido_md?: string | null;
          created_at?: string;
          examen_id?: string | null;
          id?: string;
          modulo_id?: string;
          orden?: number;
          recurso_id?: string | null;
          requisito?: Database["public"]["Enums"]["requisito_item"];
          tipo?: Database["public"]["Enums"]["tipo_item"];
          titulo?: string;
          updated_at?: string;
          url?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "items_articulo_id_fkey";
            columns: ["articulo_id"];
            isOneToOne: false;
            referencedRelation: "articulos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "items_examen_fk";
            columns: ["examen_id"];
            isOneToOne: false;
            referencedRelation: "examenes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "items_modulo_id_fkey";
            columns: ["modulo_id"];
            isOneToOne: false;
            referencedRelation: "modulos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "items_recurso_id_fkey";
            columns: ["recurso_id"];
            isOneToOne: false;
            referencedRelation: "recursos";
            referencedColumns: ["id"];
          },
        ];
      };
      mensajes: {
        Row: {
          autor_id: string;
          conversacion_id: string;
          created_at: string;
          cuerpo: string;
          id: string;
        };
        ComputedFields: never;
        Insert: {
          autor_id: string;
          conversacion_id: string;
          created_at?: string;
          cuerpo: string;
          id?: string;
        };
        Update: {
          autor_id?: string;
          conversacion_id?: string;
          created_at?: string;
          cuerpo?: string;
          id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "mensajes_autor_id_fkey";
            columns: ["autor_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "mensajes_conversacion_id_fkey";
            columns: ["conversacion_id"];
            isOneToOne: false;
            referencedRelation: "conversaciones";
            referencedColumns: ["id"];
          },
        ];
      };
      modulo_prerrequisitos: {
        Row: {
          modulo_id: string;
          requiere_modulo_id: string;
        };
        ComputedFields: never;
        Insert: {
          modulo_id: string;
          requiere_modulo_id: string;
        };
        Update: {
          modulo_id?: string;
          requiere_modulo_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "modulo_prerrequisitos_modulo_id_fkey";
            columns: ["modulo_id"];
            isOneToOne: false;
            referencedRelation: "modulos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "modulo_prerrequisitos_requiere_modulo_id_fkey";
            columns: ["requiere_modulo_id"];
            isOneToOne: false;
            referencedRelation: "modulos";
            referencedColumns: ["id"];
          },
        ];
      };
      modulos: {
        Row: {
          avance_secuencial: boolean;
          created_at: string;
          curso_id: string;
          descripcion_md: string;
          id: string;
          orden: number;
          titulo: string;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          avance_secuencial?: boolean;
          created_at?: string;
          curso_id: string;
          descripcion_md?: string;
          id?: string;
          orden?: number;
          titulo: string;
          updated_at?: string;
        };
        Update: {
          avance_secuencial?: boolean;
          created_at?: string;
          curso_id?: string;
          descripcion_md?: string;
          id?: string;
          orden?: number;
          titulo?: string;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "modulos_curso_id_fkey";
            columns: ["curso_id"];
            isOneToOne: false;
            referencedRelation: "cursos";
            referencedColumns: ["id"];
          },
        ];
      };
      opciones: {
        Row: {
          es_correcta: boolean;
          grupo: string | null;
          id: string;
          orden: number;
          posicion_correcta: number | null;
          pregunta_id: string;
          texto: string;
        };
        ComputedFields: never;
        Insert: {
          es_correcta?: boolean;
          grupo?: string | null;
          id?: string;
          orden?: number;
          posicion_correcta?: number | null;
          pregunta_id: string;
          texto: string;
        };
        Update: {
          es_correcta?: boolean;
          grupo?: string | null;
          id?: string;
          orden?: number;
          posicion_correcta?: number | null;
          pregunta_id?: string;
          texto?: string;
        };
        Relationships: [
          {
            foreignKeyName: "opciones_pregunta_id_fkey";
            columns: ["pregunta_id"];
            isOneToOne: false;
            referencedRelation: "preguntas";
            referencedColumns: ["id"];
          },
        ];
      };
      perfil_subroles: {
        Row: {
          created_at: string;
          perfil_id: string;
          subrol_id: string;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          perfil_id: string;
          subrol_id: string;
        };
        Update: {
          created_at?: string;
          perfil_id?: string;
          subrol_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "perfil_subroles_perfil_id_fkey";
            columns: ["perfil_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "perfil_subroles_subrol_id_fkey";
            columns: ["subrol_id"];
            isOneToOne: false;
            referencedRelation: "subroles";
            referencedColumns: ["id"];
          },
        ];
      };
      perfiles: {
        Row: {
          activo: boolean;
          apellido: string;
          area: Database["public"]["Enums"]["area"] | null;
          avatar_path: string | null;
          created_at: string;
          email: string;
          equipo_id: string | null;
          experiencia_previa: boolean;
          fecha_ingreso: string | null;
          id: string;
          nombre: string;
          puesto_id: string | null;
          rol: Database["public"]["Enums"]["rol_app"];
          sede_id: string | null;
          telefono: string | null;
          ubicacion_habilitada_por: string | null;
          ubicacion_rendida_at: string | null;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          activo?: boolean;
          apellido?: string;
          area?: Database["public"]["Enums"]["area"] | null;
          avatar_path?: string | null;
          created_at?: string;
          email: string;
          equipo_id?: string | null;
          experiencia_previa?: boolean;
          fecha_ingreso?: string | null;
          id: string;
          nombre: string;
          puesto_id?: string | null;
          rol?: Database["public"]["Enums"]["rol_app"];
          sede_id?: string | null;
          telefono?: string | null;
          ubicacion_habilitada_por?: string | null;
          ubicacion_rendida_at?: string | null;
          updated_at?: string;
        };
        Update: {
          activo?: boolean;
          apellido?: string;
          area?: Database["public"]["Enums"]["area"] | null;
          avatar_path?: string | null;
          created_at?: string;
          email?: string;
          equipo_id?: string | null;
          experiencia_previa?: boolean;
          fecha_ingreso?: string | null;
          id?: string;
          nombre?: string;
          puesto_id?: string | null;
          rol?: Database["public"]["Enums"]["rol_app"];
          sede_id?: string | null;
          telefono?: string | null;
          ubicacion_habilitada_por?: string | null;
          ubicacion_rendida_at?: string | null;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "perfiles_equipo_id_fkey";
            columns: ["equipo_id"];
            isOneToOne: false;
            referencedRelation: "equipos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "perfiles_puesto_id_fkey";
            columns: ["puesto_id"];
            isOneToOne: false;
            referencedRelation: "puestos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "perfiles_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "perfiles_ubicacion_habilitada_por_fkey";
            columns: ["ubicacion_habilitada_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
        ];
      };
      practica_progreso: {
        Row: {
          acertada_at: string;
          pregunta_id: string;
          usuario_id: string;
        };
        ComputedFields: never;
        Insert: {
          acertada_at?: string;
          pregunta_id: string;
          usuario_id?: string;
        };
        Update: {
          acertada_at?: string;
          pregunta_id?: string;
          usuario_id?: string;
        };
        Relationships: [
          {
            foreignKeyName: "practica_progreso_pregunta_id_fkey";
            columns: ["pregunta_id"];
            isOneToOne: false;
            referencedRelation: "preguntas";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "practica_progreso_usuario_id_fkey";
            columns: ["usuario_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
        ];
      };
      preguntas: {
        Row: {
          alcance: Database["public"]["Enums"]["alcance"];
          aprobada_at: string | null;
          aprobada_por: string | null;
          articulo_fuente_id: string | null;
          autor_id: string | null;
          caso_id: string | null;
          categoria_id: string | null;
          config: Json | null;
          contexto_md: string | null;
          created_at: string;
          dificultad: number;
          enunciado_md: string;
          estado: Database["public"]["Enums"]["estado_contenido"];
          explicacion_md: string;
          id: string;
          modulo_id: string | null;
          orden_en_caso: number | null;
          origen: Database["public"]["Enums"]["origen_pregunta"];
          promovido_at: string | null;
          promovido_por: string | null;
          puntaje_max: number;
          rubrica_md: string | null;
          sede_id: string | null;
          sede_origen_id: string | null;
          solucion: Json | null;
          tipo: Database["public"]["Enums"]["tipo_pregunta"];
          updated_at: string;
          uso: Database["public"]["Enums"]["uso_pregunta"];
        };
        ComputedFields: never;
        Insert: {
          alcance?: Database["public"]["Enums"]["alcance"];
          aprobada_at?: string | null;
          aprobada_por?: string | null;
          articulo_fuente_id?: string | null;
          autor_id?: string | null;
          caso_id?: string | null;
          categoria_id?: string | null;
          config?: Json | null;
          contexto_md?: string | null;
          created_at?: string;
          dificultad?: number;
          enunciado_md: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          explicacion_md?: string;
          id?: string;
          modulo_id?: string | null;
          orden_en_caso?: number | null;
          origen?: Database["public"]["Enums"]["origen_pregunta"];
          promovido_at?: string | null;
          promovido_por?: string | null;
          puntaje_max?: number;
          rubrica_md?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          solucion?: Json | null;
          tipo: Database["public"]["Enums"]["tipo_pregunta"];
          updated_at?: string;
          uso?: Database["public"]["Enums"]["uso_pregunta"];
        };
        Update: {
          alcance?: Database["public"]["Enums"]["alcance"];
          aprobada_at?: string | null;
          aprobada_por?: string | null;
          articulo_fuente_id?: string | null;
          autor_id?: string | null;
          caso_id?: string | null;
          categoria_id?: string | null;
          config?: Json | null;
          contexto_md?: string | null;
          created_at?: string;
          dificultad?: number;
          enunciado_md?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          explicacion_md?: string;
          id?: string;
          modulo_id?: string | null;
          orden_en_caso?: number | null;
          origen?: Database["public"]["Enums"]["origen_pregunta"];
          promovido_at?: string | null;
          promovido_por?: string | null;
          puntaje_max?: number;
          rubrica_md?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          solucion?: Json | null;
          tipo?: Database["public"]["Enums"]["tipo_pregunta"];
          updated_at?: string;
          uso?: Database["public"]["Enums"]["uso_pregunta"];
        };
        Relationships: [
          {
            foreignKeyName: "preguntas_aprobada_por_fkey";
            columns: ["aprobada_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "preguntas_articulo_fuente_id_fkey";
            columns: ["articulo_fuente_id"];
            isOneToOne: false;
            referencedRelation: "articulos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "preguntas_autor_id_fkey";
            columns: ["autor_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "preguntas_caso_id_fkey";
            columns: ["caso_id"];
            isOneToOne: false;
            referencedRelation: "casos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "preguntas_categoria_id_fkey";
            columns: ["categoria_id"];
            isOneToOne: false;
            referencedRelation: "categorias";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "preguntas_modulo_id_fkey";
            columns: ["modulo_id"];
            isOneToOne: false;
            referencedRelation: "modulos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "preguntas_promovido_por_fkey";
            columns: ["promovido_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "preguntas_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "preguntas_sede_origen_id_fkey";
            columns: ["sede_origen_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      puestos: {
        Row: {
          area: Database["public"]["Enums"]["area"] | null;
          created_at: string;
          descripcion_md: string;
          id: string;
          nombre: string;
          orden: number;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          area?: Database["public"]["Enums"]["area"] | null;
          created_at?: string;
          descripcion_md?: string;
          id?: string;
          nombre: string;
          orden?: number;
          updated_at?: string;
        };
        Update: {
          area?: Database["public"]["Enums"]["area"] | null;
          created_at?: string;
          descripcion_md?: string;
          id?: string;
          nombre?: string;
          orden?: number;
          updated_at?: string;
        };
        Relationships: [];
      };
      recursos: {
        Row: {
          alcance: Database["public"]["Enums"]["alcance"];
          archivo_path: string | null;
          autor_id: string | null;
          busqueda: unknown;
          campana_id: string | null;
          categoria_id: string;
          created_at: string;
          descripcion: string;
          estado: Database["public"]["Enums"]["estado_contenido"];
          etiquetas: string[];
          id: string;
          miniatura_path: string | null;
          promovido_at: string | null;
          promovido_por: string | null;
          sede_id: string | null;
          sede_origen_id: string | null;
          tipo: Database["public"]["Enums"]["tipo_recurso"];
          titulo: string;
          updated_at: string;
          url_externa: string | null;
          vigente_hasta: string | null;
        };
        ComputedFields: never;
        Insert: {
          alcance?: Database["public"]["Enums"]["alcance"];
          archivo_path?: string | null;
          autor_id?: string | null;
          busqueda?: never;
          campana_id?: string | null;
          categoria_id: string;
          created_at?: string;
          descripcion?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          etiquetas?: string[];
          id?: string;
          miniatura_path?: string | null;
          promovido_at?: string | null;
          promovido_por?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          tipo: Database["public"]["Enums"]["tipo_recurso"];
          titulo: string;
          updated_at?: string;
          url_externa?: string | null;
          vigente_hasta?: string | null;
        };
        Update: {
          alcance?: Database["public"]["Enums"]["alcance"];
          archivo_path?: string | null;
          autor_id?: string | null;
          busqueda?: never;
          campana_id?: string | null;
          categoria_id?: string;
          created_at?: string;
          descripcion?: string;
          estado?: Database["public"]["Enums"]["estado_contenido"];
          etiquetas?: string[];
          id?: string;
          miniatura_path?: string | null;
          promovido_at?: string | null;
          promovido_por?: string | null;
          sede_id?: string | null;
          sede_origen_id?: string | null;
          tipo?: Database["public"]["Enums"]["tipo_recurso"];
          titulo?: string;
          updated_at?: string;
          url_externa?: string | null;
          vigente_hasta?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "recursos_autor_id_fkey";
            columns: ["autor_id"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "recursos_campana_id_fkey";
            columns: ["campana_id"];
            isOneToOne: false;
            referencedRelation: "campanas";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "recursos_categoria_id_fkey";
            columns: ["categoria_id"];
            isOneToOne: false;
            referencedRelation: "categorias";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "recursos_promovido_por_fkey";
            columns: ["promovido_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "recursos_sede_id_fkey";
            columns: ["sede_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "recursos_sede_origen_id_fkey";
            columns: ["sede_origen_id"];
            isOneToOne: false;
            referencedRelation: "sedes";
            referencedColumns: ["id"];
          },
        ];
      };
      respuestas: {
        Row: {
          corregida_at: string | null;
          corregida_por: string | null;
          devolucion_md: string | null;
          es_correcta: boolean | null;
          ia_justificacion: string | null;
          ia_puntaje_sugerido: number | null;
          id: string;
          intento_id: string;
          opcion_ids: string[] | null;
          orden_respuesta: string[] | null;
          pregunta_id: string;
          puntaje: number | null;
          texto_libre: string | null;
          updated_at: string;
          valores: Json | null;
        };
        ComputedFields: never;
        Insert: {
          corregida_at?: string | null;
          corregida_por?: string | null;
          devolucion_md?: string | null;
          es_correcta?: boolean | null;
          ia_justificacion?: string | null;
          ia_puntaje_sugerido?: number | null;
          id?: string;
          intento_id: string;
          opcion_ids?: string[] | null;
          orden_respuesta?: string[] | null;
          pregunta_id: string;
          puntaje?: number | null;
          texto_libre?: string | null;
          updated_at?: string;
          valores?: Json | null;
        };
        Update: {
          corregida_at?: string | null;
          corregida_por?: string | null;
          devolucion_md?: string | null;
          es_correcta?: boolean | null;
          ia_justificacion?: string | null;
          ia_puntaje_sugerido?: number | null;
          id?: string;
          intento_id?: string;
          opcion_ids?: string[] | null;
          orden_respuesta?: string[] | null;
          pregunta_id?: string;
          puntaje?: number | null;
          texto_libre?: string | null;
          updated_at?: string;
          valores?: Json | null;
        };
        Relationships: [
          {
            foreignKeyName: "respuestas_corregida_por_fkey";
            columns: ["corregida_por"];
            isOneToOne: false;
            referencedRelation: "perfiles";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "respuestas_intento_id_fkey";
            columns: ["intento_id"];
            isOneToOne: false;
            referencedRelation: "intentos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "respuestas_pregunta_id_fkey";
            columns: ["pregunta_id"];
            isOneToOne: false;
            referencedRelation: "preguntas";
            referencedColumns: ["id"];
          },
        ];
      };
      ruta_cursos: {
        Row: {
          created_at: string;
          curso_id: string;
          id: string;
          obligatorio: boolean;
          puesto_id: string | null;
          subrol_id: string | null;
        };
        ComputedFields: never;
        Insert: {
          created_at?: string;
          curso_id: string;
          id?: string;
          obligatorio?: boolean;
          puesto_id?: string | null;
          subrol_id?: string | null;
        };
        Update: {
          created_at?: string;
          curso_id?: string;
          id?: string;
          obligatorio?: boolean;
          puesto_id?: string | null;
          subrol_id?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "ruta_cursos_curso_id_fkey";
            columns: ["curso_id"];
            isOneToOne: false;
            referencedRelation: "cursos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "ruta_cursos_puesto_id_fkey";
            columns: ["puesto_id"];
            isOneToOne: false;
            referencedRelation: "puestos";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "ruta_cursos_subrol_id_fkey";
            columns: ["subrol_id"];
            isOneToOne: false;
            referencedRelation: "subroles";
            referencedColumns: ["id"];
          },
        ];
      };
      sedes: {
        Row: {
          activa: boolean;
          ciudad: string;
          created_at: string;
          direccion: string | null;
          id: string;
          nombre: string;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          activa?: boolean;
          ciudad: string;
          created_at?: string;
          direccion?: string | null;
          id?: string;
          nombre: string;
          updated_at?: string;
        };
        Update: {
          activa?: boolean;
          ciudad?: string;
          created_at?: string;
          direccion?: string | null;
          id?: string;
          nombre?: string;
          updated_at?: string;
        };
        Relationships: [];
      };
      subroles: {
        Row: {
          area: Database["public"]["Enums"]["area"];
          created_at: string;
          descripcion_md: string;
          id: string;
          nombre: string;
          orden: number;
          updated_at: string;
        };
        ComputedFields: never;
        Insert: {
          area: Database["public"]["Enums"]["area"];
          created_at?: string;
          descripcion_md?: string;
          id?: string;
          nombre: string;
          orden?: number;
          updated_at?: string;
        };
        Update: {
          area?: Database["public"]["Enums"]["area"];
          created_at?: string;
          descripcion_md?: string;
          id?: string;
          nombre?: string;
          orden?: number;
          updated_at?: string;
        };
        Relationships: [];
      };
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      aplicar_efectos: { Args: { p_intento: string }; Returns: undefined };
      archivar: { Args: { p_archivada: boolean; p_conversacion: string }; Returns: undefined };
      asignacion_de_ruta: { Args: { p_nombre: string }; Returns: string };
      bloques_ubicacion: { Args: Record<PropertyKey, never>; Returns: string[] };
      buscar_contenido: {
        Args: { p_limite?: number; q: string };
        Returns: {
          categoria_slug: string;
          id: string;
          rango: number;
          resumen: string;
          slug: string;
          tipo: string;
          titulo: string;
        }[];
      };
      carpeta_alcance: { Args: { p_nombre: string }; Returns: Record<string, unknown> };
      cerrar_correccion: {
        Args: { p_intento: string };
        Returns: {
          aprobado: boolean;
          nota: number;
        }[];
      };
      cerrar_intento: { Args: { p_intento: string }; Returns: undefined };
      cola_correccion: {
        Args: Record<PropertyKey, never>;
        Returns: {
          asesor: string;
          correccion_vence_at: string;
          entregado_at: string;
          examen_titulo: string;
          intento_id: string;
          libres_pendientes: number;
          tomado_por: string;
          tomado_por_mi: boolean;
          vencida: boolean;
        }[];
      };
      comprobar_practica: {
        Args: { p_examen: string; p_pregunta: string; p_respuesta: Json };
        Returns: {
          es_correcta: boolean;
          explicacion_md: string;
          solucion: Json;
        }[];
      };
      contactos_bandeja: {
        Args: Record<PropertyKey, never>;
        Returns: {
          apellido: string;
          id: string;
          mismo_equipo: boolean;
          nombre: string;
          rol: Database["public"]["Enums"]["rol_app"];
          sede: string;
        }[];
      };
      contar_pozo: { Args: { p_examen: string }; Returns: number };
      contenido_compatible: {
        Args: { p_alcance: Database["public"]["Enums"]["alcance"]; p_curso: string; p_sede: string };
        Returns: boolean;
      };
      corregir_respuesta: {
        Args: { p_devolucion: string; p_puntaje: number; p_respuesta: string };
        Returns: undefined;
      };
      curso_cumplido: { Args: { p_curso: string; p_usuario: string }; Returns: boolean };
      curso_de_modulo: { Args: { p_modulo: string }; Returns: string };
      curso_desbloqueado: { Args: { p_curso: string; p_usuario: string }; Returns: boolean };
      destinatarios_consigna: { Args: { p_consigna: string }; Returns: string[] };
      entregar_intento: {
        Args: { p_intento: string };
        Returns: {
          aprobado: boolean;
          estado: Database["public"]["Enums"]["estado_intento"];
          nota: number;
        }[];
      };
      entregar_interno: { Args: { p_intento: string }; Returns: undefined };
      entregar_vencidos: { Args: Record<PropertyKey, never>; Returns: undefined };
      es_creador_de_asignacion: { Args: { p_consigna: string }; Returns: boolean };
      es_participante: { Args: { p_conversacion: string }; Returns: boolean };
      estado_curso: {
        Args: { p_curso: string };
        Returns: {
          cumplido: boolean;
          disponible: boolean;
          item_id: string;
          item_orden: number;
          modulo_cumplido: boolean;
          modulo_id: string;
          modulo_orden: number;
          modulo_titulo: string;
          requisito: Database["public"]["Enums"]["requisito_item"];
          tipo: Database["public"]["Enums"]["tipo_item"];
          titulo: string;
        }[];
      };
      estado_ubicacion: {
        Args: Record<PropertyKey, never>;
        Returns: {
          bloque_actual: number;
          habilitada: boolean;
          intento_en_curso: string;
          niveles_acreditados: number[];
          rendida: boolean;
          total_bloques: number;
        }[];
      };
      examen_ubicacion: { Args: Record<PropertyKey, never>; Returns: string };
      exigir_corrector: { Args: { p_intento: string; p_tomado: boolean }; Returns: undefined };
      exigir_participante: { Args: { p_conversacion: string }; Returns: undefined };
      f_etiquetas_texto: { Args: { etiquetas: string[] }; Returns: string };
      f_normalizar: { Args: { texto: string }; Returns: string };
      f_unaccent: { Args: { texto: string }; Returns: string };
      fin_periodo: {
        Args: { p_periodo: string; p_recurrencia: Database["public"]["Enums"]["recurrencia"] };
        Returns: string;
      };
      generar_asignaciones: { Args: { p_consigna: string; p_periodo: string }; Returns: number };
      guardar_examen: { Args: { p_datos: Json }; Returns: string };
      guardar_pregunta: { Args: { p_datos: Json }; Returns: string };
      guardar_prerrequisitos: { Args: { p_modulo: string; p_requiere: string[] }; Returns: undefined };
      guardar_respuesta: {
        Args: {
          p_intento: string;
          p_opcion_ids: string[];
          p_orden: string[];
          p_pregunta: string;
          p_texto: string;
          p_valores?: Json;
        };
        Returns: undefined;
      };
      habilitar_ubicacion: { Args: { p_usuario: string }; Returns: undefined };
      hoy_ar: { Args: Record<PropertyKey, never>; Returns: string };
      iniciar_conversacion: {
        Args: { p_asunto: string; p_cuerpo: string; p_destinatarios: string[] };
        Returns: string;
      };
      iniciar_intento: { Args: { p_examen: string }; Returns: string };
      iniciar_ubicacion: { Args: Record<PropertyKey, never>; Returns: string };
      item_cumplido: { Args: { p_item: string; p_usuario: string }; Returns: boolean };
      item_disponible: { Args: { p_item: string; p_usuario: string }; Returns: boolean };
      item_disponible_para_mi: { Args: { p_item: string }; Returns: boolean };
      marcar_item: { Args: { p_accion: string; p_item: string }; Returns: Json };
      marcar_leida: { Args: { p_conversacion: string }; Returns: undefined };
      mensajes_de: {
        Args: { p_conversacion: string };
        Returns: {
          autor: string;
          autor_id: string;
          created_at: string;
          cuerpo: string;
          id: string;
          propio: boolean;
        }[];
      };
      mensajes_sin_leer: { Args: Record<PropertyKey, never>; Returns: number };
      mi_area: { Args: Record<PropertyKey, never>; Returns: Database["public"]["Enums"]["area"] };
      mi_bandeja: {
        Args: { p_filtro?: string };
        Returns: {
          archivada: boolean;
          asunto: string;
          conversacion_id: string;
          es_anuncio: boolean;
          participantes: string;
          sin_leer: boolean;
          ultimo_autor: string;
          ultimo_cuerpo: string;
          ultimo_mensaje_at: string;
        }[];
      };
      mi_calendario: {
        Args: { p_desde: string; p_hasta: string };
        Returns: {
          categoria: string;
          estado: string;
          fecha: string;
          hora: string;
          ref_id: string;
          titulo: string;
        }[];
      };
      mi_perfil_activo: { Args: Record<PropertyKey, never>; Returns: boolean };
      mi_rol: { Args: Record<PropertyKey, never>; Returns: Database["public"]["Enums"]["rol_app"] };
      mi_ruta: {
        Args: Record<PropertyKey, never>;
        Returns: {
          cumplido: boolean;
          curso_id: string;
          desbloqueado: boolean;
          descripcion_md: string;
          items_cumplidos: number;
          items_total: number;
          nivel_orden: number;
          obligatorio: boolean;
          siguiente_item: string;
          tipo: Database["public"]["Enums"]["tipo_curso"];
          titulo: string;
        }[];
      };
      mi_sede: { Args: Record<PropertyKey, never>; Returns: string };
      mi_trabajo: {
        Args: Record<PropertyKey, never>;
        Returns: {
          hechas: number;
          por_vencer: number;
          vencidas: number;
        }[];
      };
      mis_examenes: {
        Args: Record<PropertyKey, never>;
        Returns: {
          aprobado: boolean;
          cantidad_preguntas: number;
          curso_titulo: string;
          espera_hasta: string;
          examen_id: string;
          intento_en_curso: string;
          intento_pendiente: string;
          intentos_restantes: number;
          mejor_nota: number;
          nota_minima: number;
          tiempo_limite_min: number;
          tipo: Database["public"]["Enums"]["tipo_examen"];
          titulo: string;
        }[];
      };
      modulo_cumplido: { Args: { p_modulo: string; p_usuario: string }; Returns: boolean };
      organigrama: {
        Args: Record<PropertyKey, never>;
        Returns: {
          apellido: string;
          area: Database["public"]["Enums"]["area"];
          equipo: string;
          equipo_id: string;
          es_lider: boolean;
          id: string;
          nombre: string;
          puesto: string;
          rol: Database["public"]["Enums"]["rol_app"];
          sede: string;
          sede_id: string;
          subroles: string[];
        }[];
      };
      participantes_de: {
        Args: { p_conversacion: string };
        Returns: {
          id: string;
          nombre: string;
        }[];
      };
      periodo_actual: {
        Args: { p_hoy: string; p_recurrencia: Database["public"]["Enums"]["recurrencia"] };
        Returns: string;
      };
      pozo_fuente: {
        Args: { p_categoria: string; p_curso: string; p_modulo: string; p_sede: string };
        Returns: {
          pregunta_id: string;
          unidad: string;
        }[];
      };
      pozo_practica: { Args: { p_examen: string }; Returns: string[] };
      practica_preguntas: {
        Args: { p_examen: string };
        Returns: {
          acertada: boolean;
          caso_contexto_md: string;
          caso_titulo: string;
          config: Json;
          contexto_md: string;
          enunciado_md: string;
          opciones: Json;
          orden: number;
          pregunta_id: string;
          puntaje_max: number;
          tipo: Database["public"]["Enums"]["tipo_pregunta"];
        }[];
      };
      pregunta_en_uso: { Args: { p_pregunta: string }; Returns: boolean };
      preguntas_de_unidad: {
        Args: { p_sede: string; p_unidad: string };
        Returns: {
          orden_en_caso: number;
          pregunta_id: string;
        }[];
      };
      preguntas_intento: {
        Args: { p_intento: string };
        Returns: {
          caso_contexto_md: string;
          caso_titulo: string;
          config: Json;
          contexto_md: string;
          enunciado_md: string;
          opciones: Json;
          orden: number;
          pregunta_id: string;
          puntaje_max: number;
          respuesta: Json;
          tipo: Database["public"]["Enums"]["tipo_pregunta"];
        }[];
      };
      procesar_consignas: { Args: { p_hoy?: string }; Returns: Json };
      promover_contenido: { Args: { p_id: string; p_tabla: string }; Returns: undefined };
      publicar_anuncio: { Args: { p_asunto: string; p_cuerpo: string; p_sede: string }; Returns: string };
      puede_corregir: { Args: { p_intento: string }; Returns: boolean };
      puede_crear_consigna: {
        Args: {
          p_area: Database["public"]["Enums"]["area"];
          p_destino: Database["public"]["Enums"]["destino_consigna"];
          p_equipo: string;
          p_sede: string;
          p_usuario: string;
        };
        Returns: boolean;
      };
      puede_editar_contenido: {
        Args: { p_alcance: Database["public"]["Enums"]["alcance"]; p_sede: string };
        Returns: boolean;
      };
      puede_editar_curso: { Args: { p_curso: string }; Returns: boolean };
      puede_editar_examen: { Args: { p_examen: string }; Returns: boolean };
      puede_editar_pregunta: { Args: { p_pregunta: string }; Returns: boolean };
      puede_escribir_a: { Args: { p_destino: string }; Returns: boolean };
      puede_escribir_archivo: { Args: { p_nombre: string }; Returns: boolean };
      puede_gestionar_evento: { Args: { p_sede: string }; Returns: boolean };
      puede_leer_archivo: { Args: { p_nombre: string }; Returns: boolean };
      puede_leer_contenido: {
        Args: {
          p_alcance: Database["public"]["Enums"]["alcance"];
          p_estado: Database["public"]["Enums"]["estado_contenido"];
          p_sede: string;
        };
        Returns: boolean;
      };
      puede_leer_curso: { Args: { p_curso: string }; Returns: boolean };
      puede_leer_evidencia: { Args: { p_nombre: string }; Returns: boolean };
      puede_practicar: { Args: { p_examen: string }; Returns: boolean };
      puede_rendir: { Args: { p_examen: string }; Returns: boolean };
      puede_subir_evidencia: { Args: { p_nombre: string }; Returns: boolean };
      puede_ver_intento: { Args: { p_intento: string }; Returns: boolean };
      puede_ver_usuario: { Args: { objetivo: string }; Returns: boolean };
      puede_ver_usuario_como: { Args: { p_actor: string; p_objetivo: string }; Returns: boolean };
      registrar_salida: { Args: { p_intento: string }; Returns: number };
      responder: { Args: { p_conversacion: string; p_cuerpo: string }; Returns: string };
      respuesta_correcta: {
        Args: { p_opcion_ids: string[]; p_orden: string[]; p_pregunta: string; p_valores: Json };
        Returns: boolean;
      };
      respuestas_a_corregir: {
        Args: { p_intento: string };
        Returns: {
          devolucion_md: string;
          enunciado_md: string;
          pregunta_id: string;
          puntaje: number;
          puntaje_max: number;
          respuesta_id: string;
          rubrica_md: string;
          texto_libre: string;
        }[];
      };
      revision_intento: {
        Args: { p_intento: string };
        Returns: {
          articulo_fuente_id: string;
          caso_contexto_md: string;
          caso_titulo: string;
          config: Json;
          contexto_md: string;
          devolucion_md: string;
          enunciado_md: string;
          es_correcta: boolean;
          explicacion_md: string;
          opciones: Json;
          orden: number;
          pregunta_id: string;
          puntaje: number;
          puntaje_max: number;
          respuesta: Json;
          solucion: Json;
          tipo: Database["public"]["Enums"]["tipo_pregunta"];
        }[];
      };
      soltar_correccion: { Args: { p_intento: string }; Returns: undefined };
      sortear_intento: { Args: { p_curso_bloque?: string; p_intento: string }; Returns: undefined };
      tomado_vigente: { Args: { p_corrector: string; p_tomado: string }; Returns: boolean };
      tomar_correccion: { Args: { p_intento: string }; Returns: undefined };
    };
    Enums: {
      alcance: "global" | "sede";
      area: "servicio" | "ventas";
      destino_consigna: "usuario" | "equipo" | "subrol" | "sede";
      estado_asignacion: "pendiente" | "en_curso" | "hecha" | "vencida";
      estado_certificacion: "vigente" | "vencida" | "revocada";
      estado_contenido: "borrador" | "publicado" | "archivado";
      estado_intento: "en_curso" | "pendiente_correccion" | "cerrado";
      origen_certificacion: "examen" | "ubicacion";
      origen_pregunta: "manual" | "ia";
      prioridad: "baja" | "normal" | "alta";
      recurrencia: "ninguna" | "diaria" | "semanal" | "mensual";
      requisito_item: "ninguno" | "ver" | "marcar_hecho" | "aprobar";
      rol_app: "asesor" | "lider" | "coordinador" | "director" | "admin";
      tipo_consigna: "tarea" | "lectura" | "capacitacion";
      tipo_curso: "nivel" | "capacitacion";
      tipo_evento: "capacitacion" | "evento";
      tipo_examen: "modulo" | "categoria" | "nivel" | "integrador" | "ubicacion" | "practica";
      tipo_item: "articulo" | "recurso" | "pagina" | "video" | "enlace" | "examen" | "practica";
      tipo_pregunta:
        | "opcion_multiple"
        | "verdadero_falso"
        | "escenario"
        | "ordenar"
        | "simulacion"
        | "libre"
        | "clasificar"
        | "formulario";
      tipo_recurso: "imagen" | "video" | "pdf" | "presentacion" | "enlace" | "otro";
      uso_pregunta: "examen" | "practica";
    };
    CompositeTypes: {
      [_ in never]: never;
    };
  };
};

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">;

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">];

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    keyof (DefaultSchema["Tables"] & DefaultSchema["Views"]) | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R;
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] & DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R;
      }
      ? R
      : never
    : never;

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    keyof DefaultSchema["Tables"] | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I;
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I;
      }
      ? I
      : never
    : never;

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    keyof DefaultSchema["Tables"] | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U;
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U;
      }
      ? U
      : never
    : never;

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    keyof DefaultSchema["Enums"] | { schema: keyof DatabaseWithoutInternals },
  EnumName extends (DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never) = never,
> = DefaultSchemaEnumNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never;

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    keyof DefaultSchema["CompositeTypes"] | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends (PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never) = never,
> = PublicCompositeTypeNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never;

export const Constants = {
  graphql_public: {
    Enums: {},
  },
  public: {
    Enums: {
      alcance: ["global", "sede"],
      area: ["servicio", "ventas"],
      destino_consigna: ["usuario", "equipo", "subrol", "sede"],
      estado_asignacion: ["pendiente", "en_curso", "hecha", "vencida"],
      estado_certificacion: ["vigente", "vencida", "revocada"],
      estado_contenido: ["borrador", "publicado", "archivado"],
      estado_intento: ["en_curso", "pendiente_correccion", "cerrado"],
      origen_certificacion: ["examen", "ubicacion"],
      origen_pregunta: ["manual", "ia"],
      prioridad: ["baja", "normal", "alta"],
      recurrencia: ["ninguna", "diaria", "semanal", "mensual"],
      requisito_item: ["ninguno", "ver", "marcar_hecho", "aprobar"],
      rol_app: ["asesor", "lider", "coordinador", "director", "admin"],
      tipo_consigna: ["tarea", "lectura", "capacitacion"],
      tipo_curso: ["nivel", "capacitacion"],
      tipo_evento: ["capacitacion", "evento"],
      tipo_examen: ["modulo", "categoria", "nivel", "integrador", "ubicacion", "practica"],
      tipo_item: ["articulo", "recurso", "pagina", "video", "enlace", "examen", "practica"],
      tipo_pregunta: [
        "opcion_multiple",
        "verdadero_falso",
        "escenario",
        "ordenar",
        "simulacion",
        "libre",
        "clasificar",
        "formulario",
      ],
      tipo_recurso: ["imagen", "video", "pdf", "presentacion", "enlace", "otro"],
      uso_pregunta: ["examen", "practica"],
    },
  },
} as const;
