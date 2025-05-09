# Automatiser la mise en place d'une infrastructure via CI/CD avec Terraform, Google Kubernetes Engine et Github Actions
---
## Implementation
### a. Preparation:
- Activer APIS dans la console Google Cloud (APIs & Services > Bibliothèque):
  - Kubernetes Engine API
  - Google CLoud Storage JSON API
  - Artifact Registry API
  - Service Usage API
  
- Créer un bucket GCS pour le Terraform state (Cloud storage > Buckets)
  
- Créer un compte de service “github-actions” pour le CI/CD
  - IAM > Comptes de service > Créer un compte de service
  
- Ajouter rôles au compte de service
  - Administrateur d’instances Compute (v1)
  - Administrateur de Kubernetes Engine
  - Administrateur Storage
  
- Ajouter rôle au compte utilisateur:
  - Consommateur d’utilisation du service
  
- Télécharger key.json
  - Comptes de service > … > Ajouter une clé > JSON > Télécharger
  
- Donner la permission Compute Engine default service account au SA GHA
  -  Service Accounts > ‘*-compute@developer.gserviceaccount.com’ > Gérer les autorisations > Accorder l’accès > github-actions
  
- Créer Repo Artifact Registry Docker ( Artifact Registry > Dépôts > Créer “+”) 
