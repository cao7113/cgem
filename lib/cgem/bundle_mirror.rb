# frozen_string_literal: true

module Cgem
  class BundleMirror
    attr_accessor :target, :mirror

    def initialize(target = nil)
      @target = target || "https://rubygems.org" 
    end

    def key
      "mirror.#{target}"
    end

    def get
      `bundle config #{key}`
    end

    def set(mirror)
      `bundle config #{key} #{mirror}`
    end
  end
end
