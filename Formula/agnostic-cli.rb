class AgnosticCli < Formula
  desc "Official Agnostic CLI for backend-mediated local workspace development"
  homepage "https://www.npmjs.com/package/@nsp-labs/agnostic-cli"
  url "https://registry.npmjs.org/@nsp-labs/agnostic-cli/-/agnostic-cli-0.10.0.tgz"
  sha256 "2a09121b595911ecd4c19264dc168da2131902a3c7a79a0fa985c552ceab194d"
  license "ISC"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args, "--min-release-age-exclude=@nsp-labs/agnostic-sdk"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "agnostic workspace status", shell_output("#{bin}/agnostic --help")

    package_json = libexec/"lib/node_modules/@nsp-labs/agnostic-cli/package.json"
    assert_match "\"version\": \"#{version}\"", package_json.read
  end
end
