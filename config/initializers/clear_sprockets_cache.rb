# Clear Sprockets tmp cache on boot in development to avoid Windows file-lock errors
if Rails.env.development?
  begin
    cache_dir = Rails.root.join('tmp', 'cache', 'assets')
    if cache_dir.exist?
      FileUtils.rm_rf(cache_dir)
    end
    FileUtils.mkdir_p(cache_dir)
  rescue => e
    Rails.logger.warn "Failed to reset sprockets cache: "+e.message
  end
end
