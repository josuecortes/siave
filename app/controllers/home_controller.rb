class HomeController < ApplicationController
  def index
    @ocorrencias = Ocorrencia.all.group_by(&:desdobramento_tipo_ocorrencia)
  end

  def nao_autorizado
  end
end
