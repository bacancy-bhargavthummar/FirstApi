require "uri"
require "net/http"

url = URI("http://5bd7eebeee92.ngrok.io/api/v1/articles?my_name=Bhargav")

http = Net::HTTP.new(url.host, url.port);
request = Net::HTTP::Get.new(url)
request["Cookie"] = "_first_api_session=3g9xEbHPXwZ0csrDOKrHd%2BS0ReAYfHYjHz2oZ4P7Lam6ojjUH%2BOFlQ%2FRW8NKtb5BS%2BjC3NrVJWksfC6hDERmtanBXL0rnBoweXwi6kuzGnwXLp2uNpJ8XU4%2FnhtrlD5Y6lw%2Fs84ViZGNjV4K9cHGhPjxVjz0dJaQ8%2Fhysdm8fFPxfPd2sIG3WiVwGxX%2FnFtscjsHNTd0Mro19lZzETqlONGbSc2Y%2B8HfsgR0l5SwkH%2Bhgf3V1C4siKRH6AuP%2FZDD4M9%2FMhGEcpNQ7SRIDiVDHXVmaScG64tkYu0%3D--svuvouTgKV8AUTbi--GfhCi8vE0fx79jhxC7LrUg%3D%3D"

response = http.request(request)
puts response.read_body

