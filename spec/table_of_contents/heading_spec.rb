require "spec_helper"

describe GovukTechDocs::TableOfContents::Heading do
  describe "#size" do
    it "returns the level of the heading" do
      heading = described_class.new(element_name: "h2", text: "", attributes: {})

      expect(heading.size).to eq(2)
    end
  end

  describe "#href" do
    describe "when page is specified" do
      describe "and heading is h1" do
        it "returns an href with page and without fragment" do
          heading = described_class.new(element_name: "h1", text: "", page_url: "index.html", attributes: { "id" => "apple-recipes" })

          expect(heading.href).to eq("index.html")
        end
      end

      describe "and heading is not h1" do
        it "returns an href with page and fragment" do
          heading = described_class.new(element_name: "h2", text: "", page_url: "index.html", attributes: { "id" => "apple-recipes" })

          expect(heading.href).to eq("index.html#apple-recipes")
        end
      end
    end

    describe "when page is not specified" do
      describe "and heading is h1" do
        it "returns a fragment href" do
          heading = described_class.new(element_name: "h1", text: "", attributes: { "id" => "apple-recipes" })

          expect(heading.href).to eq("#apple-recipes")
        end
      end

      describe "and heading is not h1" do
        it "returns a fragment href" do
          heading = described_class.new(element_name: "h2", text: "", attributes: { "id" => "apple-recipes" })

          expect(heading.href).to eq("#apple-recipes")
        end
      end
    end
  end

  describe "#title" do
    it "returns the text of the element" do
      heading = described_class.new(element_name: "", text: "Apples", attributes: {})

      expect(heading.title).to eq("Apples")
    end
  end

  describe "#==" do
    it "is true if the element_name, text and attributes match" do
      a = described_class.new(element_name: "h1", text: "Cars", attributes: { "id" => "cars" })
      b = described_class.new(element_name: "h1", text: "Cars", attributes: { "id" => "cars" })

      expect(a).to eq(b)
    end

    it "is false if the element_name differs" do
      a = described_class.new(element_name: "h1", text: "Cars", attributes: { "id" => "cars" })
      b = described_class.new(element_name: "h2", text: "Cars", attributes: { "id" => "cars" })

      expect(a).to_not eq(b)
    end

    it "is false if the text differs" do
      a = described_class.new(element_name: "h1", text: "Cars", attributes: { "id" => "cars" })
      b = described_class.new(element_name: "h1", text: "Boats", attributes: { "id" => "cars" })

      expect(a).to_not eq(b)
    end

    it "is false if the attributes differ" do
      a = described_class.new(element_name: "h1", text: "Cars", attributes: { "id" => "cars" })
      b = described_class.new(element_name: "h1", text: "Cars", attributes: {})

      expect(a).to_not eq(b)
    end
  end
end
