module NewsHelper
  def id_escape(s)
    s.gsub(/\s/, '_').camelcase
  end
end
