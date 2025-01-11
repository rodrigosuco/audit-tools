# frozen_string_literal: true

class BaseService
  def self.call(*args, &block)
    new(*args, &block).execute
  end

  def execute
    raise NotImplementedError
  end

  def check_required_params(required_params)
    params.delete_if { | key, value | value.blank? }
    return if params.values_at(*required_params).all?

    raise StandardError.new 'Existem campos obrigatórios vazios'
  end
end
