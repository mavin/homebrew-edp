class TerraformPlus < Formula
  version "0.6.14+0.1"
  desc "A custom Terraform distro with extra plugins we use at Say Media"
  homepage "https://github.com/saymedia/terraform-plus"
  url "https://github.com/saymedia/terraform-plus/releases/download/v#{version}/terraform-darwin.zip"
  sha256 "3b3fed7f6efe43342b17651da55598001b5ab703ffdf022d2b395621521614a1"

  conflicts_with "terraform", :because => "terraform-plus overrides the terraform binary"

  def install
      bin.install Dir["terraform*"]
  end

  test do
      output = shell_output(bin/"terraform version")
      assert_match version.to_s, output
  end
end
