terraform-bootstrap-gcp
=======================

This project uses GCP's Infrastructure Manager to deploy the necessary resources to start using
Terraform/OpenTofu.

However, GCP's Infrastructure Manager itself understands Terraform/OpenTofu, so this is perhaps of
limited usefulness. Infrastructure Manager is limited to certain versions of Terraform, however.

To get started, create a Service Account for the deployment and ensure that it is granted the
"Cloud Infrastructure Manager Agent" role (`roles/config.agent`) on your project. You may also need
to grant permissions to manage the resources that you create; so in the case of this project,
"Cloud Storage Admin" (`roles/storage.admin`) on the project.

Then create a deployment in the Infrastructure Management console, or on the command line, with:

```sh
gcloud infra-manager deployments apply (name) \
  --location=(location) \
  --git-source-repo https://github.com/NewRedo/terraform-bootstrap-gcp \
  --input-values="bucket_prefix=(prefix),project=(gcp_project)" \
  --service-account=(service_account_email_address)
```

It appears that only some locations are supported for Infrastrucutre Manager; therefore it is
recommended to chose one of the regions listed in the ["Restricted regions" documentation](https://cloud.google.com/build/docs/locations#restricted_regions_for_some_projects)
