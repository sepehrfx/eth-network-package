TCP_PROTOCOL = "TCP"
UDP_PROTOCOL = "UDP"
HTTP_APPLICATION_PROTOCOL = "http"
NOT_PROVIDED_APPLICATION_PROTOCOL = ""
NOT_PROVIDED_WAIT = "not-provided-wait"
def new_template_and_data(template, template_data_json):
	return struct(template = template, data = template_data_json)


def path_join(*args):
	joined_path = "/".join(args)
	return joined_path.replace("//", "/")


def path_base(path):
	split_path = path.split("/")
	return split_path[-1]


def path_dir(path):
	split_path = path.split("/")
	if len(split_path) <= 1:
		return "."
	split_path = split_path[:-1]
	return "/".join(split_path) or "/"


def new_port_spec(number, transport_protocol, application_protocol = NOT_PROVIDED_APPLICATION_PROTOCOL, wait = NOT_PROVIDED_WAIT):
	if (wait == NOT_PROVIDED_WAIT):
		return PortSpec(number = number, transport_protocol = transport_protocol, application_protocol = application_protocol)

	return PortSpec(number = number, transport_protocol = transport_protocol, application_protocol = application_protocol, wait = wait)


def read_file_from_service(plan, service_name, filename):
	output = plan.exec(
		service_name = service_name,
		recipe = ExecRecipe(
			command = ["/bin/sh", "-c", "cat {} | tr -d '\n'".format(filename)]
		)
	)
	return output["output"]


def download_trusted_setup(plan, service_name, output_filepath):
	plan.exec(
		service_name = service_name,
		recipe = ExecRecipe(
			command = ["wget", "-O", output_filepath, "https://raw.githubusercontent.com/ethereum/c-kzg-4844/main/src/trusted_setup.txt"]
		)
	)
