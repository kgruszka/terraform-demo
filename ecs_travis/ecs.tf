module "ecs" {
    # source = "github.com/getndazn/terraform-demo-daznapi.git//modules//ecs?ref=v0.0.1"
    source = "../modules/ecs"

    region = "${var.region}"
    cluster_name = "${var.cluster_name}"
    cluster_key_name = "${var.cluster_key_name}"
}
