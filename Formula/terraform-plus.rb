class TerraformPlus < Formula
  version "0.6.14+0.2"
  desc "A custom Terraform distro with extra plugins we use at Say Media"
  homepage "https://github.com/saymedia/terraform-plus"
  url "https://github.com/saymedia/terraform-plus/releases/download/v#{version}/terraform-plus-v#{version.to_s.sub! "+", "."}-darwin.zip"
  sha256 "4593c759c040737e6e9fbb0e4a180f90e7ccf51eb78a645f7ffb8c23c6b385d6"

  conflicts_with "terraform", :because => "terraform-plus overrides the terraform binary"

  def install
      bin.install Dir["terraform*"]
  end

  test do
      output = shell_output(bin/"terraform version")
      assert_match version.to_s, output
  end
end
