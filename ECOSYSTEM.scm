;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — shift-ssg

(ecosystem
  (version "1.0.0")
  (name "shift-ssg")
  (type "satellite-ssg")
  (purpose "Satellite SSG implementation providing direct adapter access for static site generation")

  (position-in-ecosystem
    "Shift SSG is a satellite implementation in the hyperpolymath ecosystem.
     It provides direct access to 28 SSG adapters for static site generation.
     Follows RSR (Rhodium Standard Repository) guidelines for compliance.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28 SSGs - provides adapter interface")
      (differentiation
        "poly-ssg-mcp = Hub with all SSG adapters via MCP protocol
         shift-ssg = Satellite implementation for direct adapter usage"))
    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")
      (description "RSR compliance baseline for repository structure and security")))

  (adapters
    (count 28)
    (languages ("Rust" "Haskell" "Elixir" "Julia" "Clojure" "Racket" "OCaml" "F#" "Scala" "Kotlin" "Erlang" "Nim"))
    (categories
      ("functional" . ("babashka" "coleslaw" "pollen" "frog" "perun" "cryogen"))
      ("statically-typed" . ("cobalt" "mdbook" "fornax" "laika" "orchid" "zola"))
      ("elixir-ecosystem" . ("nimble-publisher" "serum" "tableau"))
      ("scientific" . ("documenter" "franklin" "ema" "hakyll"))))

  (what-this-is
    "Shift SSG is a satellite static site generator implementation that:
     - Provides 28 SSG adapters for various programming languages
     - Integrates with the poly-ssg-mcp hub ecosystem
     - Follows RSR compliance for security and maintainability
     - Supports Deno runtime for adapter execution")

  (what-this-is-not
    "- NOT a standalone SSG (uses existing SSG tools via adapters)
     - NOT a replacement for poly-ssg-mcp (complements it)
     - NOT exempt from RSR compliance requirements"))
