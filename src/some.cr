class Some(T)
  VERSION = "1.0.0"

  def initialize(@value : T | Nil)
  end

  def fmap(&block)
    yield @value.not_nil! unless @value.nil?
  end
end

macro some_object_extension(method_name = nil)
  {% m_name = method_name ? method_name : :fmap %}
  class Object
    def {{ m_name.id }}(&block)
      yield self.not_nil! unless self.nil?
    end
  end
end
