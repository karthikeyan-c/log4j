function add_tag(tag, timestamp, record)
    new_record = {}
    new_record["Pod Name"] = os.getenv("HOSTNAME")
    new_record["Pod Uid"] = os.getenv("MY_POD_IP")
    new_record["Container Name"] = "FINBRANCH-FIP-AC"
    new_record["Container ID"] = "2"
    new_record["Node"] = os.getenv("MY_NODE_IP")
    new_record["Namespace"] = os.getenv("MY_POD_NAMESPACE")
    new_record["Labels"] = "FinacleAppserver"
    new_record["serviceID"] = "Finacle-SGTD"
    new_record["msg_uid"] = record.msg_uid
    new_record["type"] = "Finacle-SGTD_" .. record.type
    new_record["client_ip"] = ""

    if record.status == "S" then
       new_record["statusCode"] = "200"
    else
       new_record["statusCode"] = "426"
    end

    new_record["timestamp_log"] = record.start_time
    new_record["error_classification"] = "Functional"
    new_record["error_type"] = record.error
    new_record["execution_time_milliseconds"] = record.elapse

    return 1, timestamp, new_record
    end
