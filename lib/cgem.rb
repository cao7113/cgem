# frozen_string_literal: true

require 'yaml'
require "cgem/version"
require "cgem/bundle_mirror"

module Cgem
  module Config
    def root
      __dir__
    end

    def gem_sources
      configured_info['gem_sources'] 
      #rescue {}
    end  

    def configured_info
      YAML.load(File.read(sources_path), aliases: true)
    end

    def sources_path
      sources_paths.find { |p| File.exist?(p) }
    end

    def sources_paths
      [env_sources_path, dot_sources_path, default_sources_path].compact
    end

    def env_sources_path
      ENV['CGEM_SOURCES_PATH']
    end

    def user_home
      File.expand_path('~')
    end

    def dot_sources_path
      File.join(user_home, '.cgem.yml')
    end

    def default_sources_path
      File.join(root, 'default.yml')
    end
  end
  
  module Gemrc
    def dot_gemrc
      File.join(user_home, '.gemrc')
    end

    def set_gemrc_sources(source)
      settings = {}
      if File.exist?(dot_gemrc)
        settings = YAML.load(File.read(dot_gemrc))
      end
      settings[:sources] = ["#{source.chomp('/')}/"]
      File.write(dot_gemrc, settings.to_yaml)
    end

    def gemrc_sources
      return unless File.exist?(dot_gemrc)
      settings = YAML.load(File.read(dot_gemrc))
      settings[:sources]
    end
  end

  extend Config
  extend Gemrc
end
