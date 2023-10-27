defmodule Headlines do
  use Crawly.Spider

  @impl Crawly.Spider
  def base_url(), do: "https://www.afr.com/companies/financial-services"

  @impl Crawly.Spider
  def init() do
    [start_urls: ["https://www.afr.com/companies/financial-services"]]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    # Parse response body to document
    {:ok, document} = Floki.parse_document(response.body)

    case response do
      %HTTPoison.Response{status_code: 200, body: body} ->
        # Parse the HTML content using a library like Floki or similar
        doc = Floki.parse_document(body)

        # Define a CSS selector to locate the headlines
        headlines = Floki.find(doc, "your-css-selector-for-headlines")

        # Extract and process the headlines
        headlines_data =
          headlines
          |> Enum.map(&Floki.text/1)

        # You can further process or store the headlines as needed
        # For now, we'll just print them
        IO.inspect(headlines_data)

      _ ->
        IO.puts("Failed to retrieve the webpage")

        # %{items: items, requests: next_requests}
    end
  end
end
