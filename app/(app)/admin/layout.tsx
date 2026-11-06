import { PestanasAdmin } from "./pestanas";

export default function LayoutAdmin({ children }: LayoutProps<"/admin">) {
  return (
    <div className="flex flex-col gap-5">
      <PestanasAdmin />
      {children}
    </div>
  );
}
