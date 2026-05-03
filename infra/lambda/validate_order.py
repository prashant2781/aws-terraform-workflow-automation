def lambda_handler(event, context):
    order_id = event.get("order_id")

    if not order_id:
        raise Exception("order_id is missing")

    return {
        "status": "VALIDATED",
        "order_id": order_id
    }
