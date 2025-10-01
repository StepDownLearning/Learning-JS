{
  description = "JS dev shell (Node + pnpm + TS + ESLint/Prettier + LSP)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              nodejs_22
              pnpm
              yarn
              nodePackages.typescript
              nodePackages.typescript-language-server
              nodePackages.eslint
              nodePackages.prettier
              vscode-langservers-extracted
              nodePackages.live-server
              deno
              bun
              git
              bashInteractive
            ];

            shellHook = ''
              # Corepack ships with Node; enable shims for yarn/pnpm if you prefer:
              corepack enable >/dev/null 2>&1 || true

              echo
              echo "✅ JS shell ready → node $(node -v)"
              echo "   pnpm $(pnpm -v) • eslint $(eslint -v) • prettier $(prettier -v)"
              echo "Tips:"
              echo "  • pnpm dlx create-vite@latest myapp -- --template react"
              echo "  • live-server .   # serve current dir"
              echo
            '';
          };

          # Minimal shell — just Node + pnpm + TS
          minimal = pkgs.mkShell {
            packages = with pkgs; [
              nodejs_22
              pnpm
              nodePackages.typescript
            ];
          };
        };
      }
    );
}
