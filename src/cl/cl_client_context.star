def new_cl_client_context(
	client_name,
	enr,
	ip_addr,
	http_port_num,
	cl_nodes_metrics_info,
	beacon_service_name,
	validator_service_name = "",
	multiaddr = "",
	peer_id = "",
	snooper_enabled = False,
	snooper_engine_context = None):
	return struct(
		client_name = client_name,
		enr = enr,
		ip_addr = ip_addr,
		http_port_num = http_port_num,
		cl_nodes_metrics_info = cl_nodes_metrics_info,
		beacon_service_name = beacon_service_name,
		validator_service_name = validator_service_name,
		multiaddr = multiaddr,
		peer_id = peer_id,
		snooper_enabled = snooper_enabled,
		snooper_engine_context = snooper_engine_context
	)
