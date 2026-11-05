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
      f_etiquetas_texto: { Args: { etiquetas: string[] }; Returns: string };
      f_unaccent: { Args: { texto: string }; Returns: string };
      mi_area: { Args: Record<PropertyKey, never>; Returns: Database["public"]["Enums"]["area"] };
      mi_perfil_activo: { Args: Record<PropertyKey, never>; Returns: boolean };
      mi_rol: { Args: Record<PropertyKey, never>; Returns: Database["public"]["Enums"]["rol_app"] };
      mi_sede: { Args: Record<PropertyKey, never>; Returns: string };
      promover_contenido: { Args: { p_id: string; p_tabla: string }; Returns: undefined };
      puede_editar_contenido: {
        Args: { p_alcance: Database["public"]["Enums"]["alcance"]; p_sede: string };
        Returns: boolean;
      };
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
      puede_ver_usuario: { Args: { objetivo: string }; Returns: boolean };
    };
    Enums: {
      alcance: "global" | "sede";
      area: "servicio" | "ventas";
      estado_contenido: "borrador" | "publicado" | "archivado";
      rol_app: "asesor" | "lider" | "coordinador" | "director" | "admin";
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
      estado_contenido: ["borrador", "publicado", "archivado"],
      rol_app: ["asesor", "lider", "coordinador", "director", "admin"],
      tipo_recurso: ["imagen", "video", "pdf", "presentacion", "enlace", "otro"],
    },
  },
} as const;
