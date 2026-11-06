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
      archivar: { Args: { p_archivada: boolean; p_conversacion: string }; Returns: undefined };
      asignacion_de_ruta: { Args: { p_nombre: string }; Returns: string };
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
      contenido_compatible: {
        Args: { p_alcance: Database["public"]["Enums"]["alcance"]; p_curso: string; p_sede: string };
        Returns: boolean;
      };
      curso_cumplido: { Args: { p_curso: string; p_usuario: string }; Returns: boolean };
      curso_de_modulo: { Args: { p_modulo: string }; Returns: string };
      curso_desbloqueado: { Args: { p_curso: string; p_usuario: string }; Returns: boolean };
      destinatarios_consigna: { Args: { p_consigna: string }; Returns: string[] };
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
      exigir_participante: { Args: { p_conversacion: string }; Returns: undefined };
      f_etiquetas_texto: { Args: { etiquetas: string[] }; Returns: string };
      f_unaccent: { Args: { texto: string }; Returns: string };
      fin_periodo: {
        Args: { p_periodo: string; p_recurrencia: Database["public"]["Enums"]["recurrencia"] };
        Returns: string;
      };
      generar_asignaciones: { Args: { p_consigna: string; p_periodo: string }; Returns: number };
      guardar_prerrequisitos: { Args: { p_modulo: string; p_requiere: string[] }; Returns: undefined };
      iniciar_conversacion: {
        Args: { p_asunto: string; p_cuerpo: string; p_destinatarios: string[] };
        Returns: string;
      };
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
      procesar_consignas: { Args: { p_hoy?: string }; Returns: Json };
      promover_contenido: { Args: { p_id: string; p_tabla: string }; Returns: undefined };
      publicar_anuncio: { Args: { p_asunto: string; p_cuerpo: string; p_sede: string }; Returns: string };
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
      puede_escribir_a: { Args: { p_destino: string }; Returns: boolean };
      puede_escribir_archivo: { Args: { p_nombre: string }; Returns: boolean };
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
      puede_subir_evidencia: { Args: { p_nombre: string }; Returns: boolean };
      puede_ver_usuario: { Args: { objetivo: string }; Returns: boolean };
      puede_ver_usuario_como: { Args: { p_actor: string; p_objetivo: string }; Returns: boolean };
      responder: { Args: { p_conversacion: string; p_cuerpo: string }; Returns: string };
    };
    Enums: {
      alcance: "global" | "sede";
      area: "servicio" | "ventas";
      destino_consigna: "usuario" | "equipo" | "subrol" | "sede";
      estado_asignacion: "pendiente" | "en_curso" | "hecha" | "vencida";
      estado_contenido: "borrador" | "publicado" | "archivado";
      prioridad: "baja" | "normal" | "alta";
      recurrencia: "ninguna" | "diaria" | "semanal" | "mensual";
      requisito_item: "ninguno" | "ver" | "marcar_hecho" | "aprobar";
      rol_app: "asesor" | "lider" | "coordinador" | "director" | "admin";
      tipo_consigna: "tarea" | "lectura" | "capacitacion";
      tipo_curso: "nivel" | "capacitacion";
      tipo_item: "articulo" | "recurso" | "pagina" | "video" | "enlace" | "examen";
      tipo_recurso: "imagen" | "video" | "pdf" | "presentacion" | "enlace" | "otro";
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
      estado_contenido: ["borrador", "publicado", "archivado"],
      prioridad: ["baja", "normal", "alta"],
      recurrencia: ["ninguna", "diaria", "semanal", "mensual"],
      requisito_item: ["ninguno", "ver", "marcar_hecho", "aprobar"],
      rol_app: ["asesor", "lider", "coordinador", "director", "admin"],
      tipo_consigna: ["tarea", "lectura", "capacitacion"],
      tipo_curso: ["nivel", "capacitacion"],
      tipo_item: ["articulo", "recurso", "pagina", "video", "enlace", "examen"],
      tipo_recurso: ["imagen", "video", "pdf", "presentacion", "enlace", "otro"],
    },
  },
} as const;
