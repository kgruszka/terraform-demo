module "ecs" {
    # source = "github.com/getndazn/terraform-demo-daznapi.git//ecs?ref=v0.0.1"
    source = "../003_ecs"

    region = "${var.region}"
    cluster_name = "${var.cluster_name}"
    cluster_key_name = "${var.cluster_key_name}"
}
