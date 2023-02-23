require 'octokit'

class Repository
  attr_reader :owner, :display_name, :name, :prerelease, :path, :prefix

  def release?
    return @path.nil?
  end

  def initialize(owner, display_name, name, options = {})
    @owner = owner
    @display_name = display_name
    @name = name
    @prerelease = options[:prerelease] || false
    @path = options[:path]
    @prefix = options[:prefix]
  end

  def github_repository
    return Octokit::Repository.new("#{owner}/#{name}")
  end
end