module "ecs" {
    source = "github.com/kgruszka/terraform-demo.git//ecs_module?ref=v0.0.1"
    # source = "../ecs_module"

    cluster_name = "${var.cluster_name}"
    cluster_key_name = "${var.cluster_key_name}"
}
