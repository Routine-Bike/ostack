# Generator: .gitignore

Generate a .gitignore tailored to the chosen stack.

---

## Always Include (every project)

```gitignore
# Environment
.env
.env.local
.env.*.local

# OS
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
*.swp
*.swo

# GCP keys (should be in ~/.gcloud-keys/, but just in case)
*.json.key
service-account*.json
```

## By Language/Framework

### TypeScript / Next.js

```gitignore
node_modules/
.next/
out/
dist/
*.tsbuildinfo
.turbo/
```

### Python

```gitignore
__pycache__/
*.pyc
*.pyo
.venv/
venv/
*.egg-info/
dist/
build/
.ruff_cache/
wandb/
*.pt
*.bin
*.safetensors
```

### Rust

```gitignore
target/
Cargo.lock  # only for libraries; keep for binaries
```

### Go

```gitignore
bin/
vendor/
```

## By Service

### Docker

```gitignore
# Don't ignore Dockerfile or .dockerignore
```

### Terraform (if used)

```gitignore
.terraform/
*.tfstate
*.tfstate.backup
*.tfvars
```

---

Combine the "Always Include" section with the relevant language/framework and service sections.
