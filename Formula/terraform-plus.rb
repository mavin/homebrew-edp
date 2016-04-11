class TerraformPlus < Formula
  version "0.6.14+0.2"
  desc "A custom Terraform distro with extra plugins we use at Say Media"
  homepage "https://github.com/saymedia/terraform-plus"
  url "https://github.com/saymedia/terraform-plus/releases/download/v#{version}/terraform-plus-v#{version.to_s.sub! "+", "."}-darwin.zip"
  sha256 "3f0740a234066b8733c2f8bacfb4afe06b5a4dc396e6fe2aa58466c0ad891492"

  conflicts_with "terraform", :because => "terraform-plus overrides the terraform binary"

  def install
      bin.install Dir["terraform*"]
  end

  test do
      output = shell_output(bin/"terraform version")
      assert_match version.to_s, output
  end
end
