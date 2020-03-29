module Concerns
  module PaginationHeader
    extend ActiveSupport::Concern

    def set_pagination_header(list)
      properties = [:current_page, :limit_value, :next_page, :prev_page, :total_pages, :total_count]
      response.headers['X-pagination'] = properties.map { |prop| "#{prop}=#{list.public_send(prop)}" }.join(',')
    end
  end
end
