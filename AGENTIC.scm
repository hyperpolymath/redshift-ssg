;;; AGENTIC.scm — shift-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; Agentic AI configuration for shift-ssg development assistance

(define-module (shift-ssg agentic)
  #:export (agent-config capabilities constraints tools))

;; ═══════════════════════════════════════════════════════════════════════════════
;; AGENT CONFIGURATION
;; ═══════════════════════════════════════════════════════════════════════════════

(define agent-config
  '((identity
     ((name . "shift-ssg-agent")
      (purpose . "Assist with shift-ssg development, testing, and maintenance")
      (domain . "Static site generator adapter development")
      (runtime . "Claude Code / Claude Agent SDK")))

    (context
     ((project . "shift-ssg")
      (type . "satellite-ssg")
      (ecosystem . "hyperpolymath")
      (languages . ("JavaScript" "TypeScript"))
      (runtime . "Deno")
      (adapters . 28)))

    (behavior
     ((style . "professional-objective")
      (verbosity . "concise")
      (proactivity . "moderate")
      (error-handling . "graceful-with-context")))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; AGENT CAPABILITIES
;; ═══════════════════════════════════════════════════════════════════════════════

(define capabilities
  '((code-operations
     ((read-files
       ((description . "Read and analyze source files")
        (scope . ("adapters/*.js" "src/**" "tests/**"))
        (permissions . "read-only")))
      (edit-files
       ((description . "Modify source files")
        (scope . ("adapters/*.js" "src/**" "tests/**" "*.scm" "*.md" "*.adoc"))
        (requires-approval . #f)))
      (create-files
       ((description . "Create new files")
        (scope . ("src/**" "tests/**" "docs/**"))
        (requires-approval . #f)))))

    (build-operations
     ((run-commands
       ((description . "Execute build and test commands")
        (allowed-commands
         ("just check" "just test" "just lint" "just fmt"
          "just build" "just ci" "just status"
          "bash Mustfile build" "bash Mustfile test"
          "node --check" "deno test" "deno lint" "deno fmt"
          "git status" "git diff" "git log" "git add" "git commit" "git push"))
        (blocked-commands
         ("rm -rf /" "sudo" "eval" "curl | sh"))))))

    (git-operations
     ((commits
       ((description . "Create commits with conventional format")
        (format . "<type>(<scope>): <description>")
        (types . ("feat" "fix" "docs" "style" "refactor" "test" "chore" "security"))))
      (branches
       ((description . "Create and switch branches")
        (naming . "<type>/<description>")
        (protected . ("main" "master"))))
      (push
       ((description . "Push to remote")
        (requires-approval . #f)
        (force-push . #f)))))

    (documentation
     ((read-docs
       ((description . "Read and analyze documentation")
        (scope . ("*.md" "*.adoc" "*.scm"))))
      (write-docs
       ((description . "Create and update documentation")
        (scope . ("docs/**" "*.md" "*.adoc"))))))

    (analysis
     ((codebase-exploration
       ((description . "Explore and understand codebase structure")
        (tools . ("Glob" "Grep" "Read"))))
      (security-analysis
       ((description . "Identify security issues")
        (patterns . ("hardcoded secrets" "injection vulnerabilities" "unsafe operations"))))
      (adapter-validation
       ((description . "Validate SSG adapter implementations")
        (checks . ("syntax" "interface-compliance" "export-validation"))))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; AGENT CONSTRAINTS
;; ═══════════════════════════════════════════════════════════════════════════════

(define constraints
  '((security
     ((no-secrets
       ((description . "Never commit or expose secrets")
        (patterns . ("API keys" "passwords" "tokens" "private keys"))))
      (no-destructive-ops
       ((description . "Avoid destructive operations")
        (blocked . ("force push" "hard reset" "delete main"))))
      (code-review
       ((description . "Review code for security issues")
        (check-for . ("eval" "shell injection" "XSS" "SQL injection"))))))

    (quality
     ((conventional-commits
       ((description . "Use conventional commit format")
        (required . #t)))
      (test-before-commit
       ((description . "Run tests before committing")
        (command . "just ci")))
      (lint-before-commit
       ((description . "Lint code before committing")
        (command . "just lint")))))

    (boundaries
     ((scope
       ((description . "Stay within project scope")
        (project-root . "/home/user/shift-ssg")
        (allowed-paths . ("adapters/" "src/" "tests/" "docs/" ".github/"))))
      (approval-required
       ((description . "Operations requiring user approval")
        (operations . ("delete files" "major refactoring" "dependency updates"))))))

    (ethical
     ((no-malware
       ((description . "Never create or assist with malware")))
      (no-deception
       ((description . "Be transparent about capabilities and limitations")))
      (user-intent
       ((description . "Always act in user's best interest")))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; AVAILABLE TOOLS
;; ═══════════════════════════════════════════════════════════════════════════════

(define tools
  '((file-operations
     ((Read . "Read file contents")
      (Write . "Write file contents")
      (Edit . "Edit file contents")
      (Glob . "Find files by pattern")
      (Grep . "Search file contents")))

    (execution
     ((Bash . "Execute shell commands")
      (Task . "Launch specialized sub-agents")))

    (planning
     ((TodoWrite . "Manage task lists")
      (EnterPlanMode . "Enter planning mode")
      (ExitPlanMode . "Exit planning mode")))

    (web
     ((WebSearch . "Search the web")
      (WebFetch . "Fetch web content")))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; TASK PATTERNS
;; ═══════════════════════════════════════════════════════════════════════════════

(define task-patterns
  '((adapter-development
     ((pattern . "Create or modify SSG adapter")
      (steps
       (("Understand requirements" . "Read existing adapters for patterns")
        ("Create/edit adapter file" . "adapters/<name>.js")
        ("Implement interface" . "name, language, description, connect, disconnect, tools")
        ("Validate" . "just adapter-check <name>")
        ("Test" . "just adapter-test <name>")
        ("Document" . "Update adapters/README.md")))))

    (bug-fix
     ((pattern . "Fix a bug in the codebase")
      (steps
       (("Understand issue" . "Read error messages, reproduce")
        ("Locate cause" . "Search codebase")
        ("Implement fix" . "Edit affected files")
        ("Test fix" . "just test")
        ("Commit" . "git commit -m 'fix: <description>'")))))

    (documentation
     ((pattern . "Create or update documentation")
      (steps
       (("Understand scope" . "What needs documenting")
        ("Read existing docs" . "Check for patterns")
        ("Write documentation" . "In appropriate format")
        ("Validate links" . "Check internal references")
        ("Commit" . "git commit -m 'docs: <description>'")))))))

;; ═══════════════════════════════════════════════════════════════════════════════
;; MCP INTEGRATION
;; ═══════════════════════════════════════════════════════════════════════════════

(define mcp-config
  '((protocol . "MCP 1.0")
    (server
     ((name . "shift-ssg-mcp")
      (description . "Shift SSG adapter server")
      (tools
       ((adapter-list . "List all available adapters")
        (adapter-info . "Get adapter details")
        (adapter-connect . "Connect to an adapter")
        (adapter-disconnect . "Disconnect from an adapter")
        (adapter-invoke . "Invoke adapter tool")))))))
