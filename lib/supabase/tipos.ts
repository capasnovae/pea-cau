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
      mi_area: { Args: Record<PropertyKey, never>; Returns: Database["public"]["Enums"]["area"] };
      mi_perfil_activo: { Args: Record<PropertyKey, never>; Returns: boolean };
      mi_rol: { Args: Record<PropertyKey, never>; Returns: Database["public"]["Enums"]["rol_app"] };
      mi_sede: { Args: Record<PropertyKey, never>; Returns: string };
      puede_ver_usuario: { Args: { objetivo: string }; Returns: boolean };
    };
    Enums: {
      area: "servicio" | "ventas";
      rol_app: "asesor" | "lider" | "coordinador" | "director" | "admin";
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
      area: ["servicio", "ventas"],
      rol_app: ["asesor", "lider", "coordinador", "director", "admin"],
    },
  },
} as const;
