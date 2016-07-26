class HomeController < ApplicationController
  def index
    @ocorrencias = Ocorrencia.all.group_by(&:tipo_desdobramento_ocorrencia)
    @minha_escola = Ocorrencia.where('escola_id = ?', current_user.escola_id).group_by(&:tipo_desdobramento_ocorrencia)

  end

  def estatisticas

  	if params[:data_inicial].blank?
  		#@mini = Date.today.beginning_of_month
      @data_inicial = DateTime.now.beginning_of_month
    else
      @data_inicial = params[:data_inicial]
    end
    
    if params[:data_fim].blank?
  		#@mfim = Date.today.end_of_month
      @data_fim = DateTime.now.end_of_month
    else
      @data_fim = params[:data_fim]
    end

   
    
    if params[:escola].blank?
      #@mfim = Date.today.end_of_month
      @escola = *
    else
      @escola = params[:escola]
    end

    #@ini = "#{@mini}/#{@aini}".to_date.beginning_of_month
    #@fim = "#{@mfim}/#{@afim}".to_date.end_of_month

    
    if @data_inicial > @data_fim
      @data_inicial = Date.today.beginning_of_month
      @data_fim = Date.today.end_of_month
      flash[:info] = "A data final era maior que a data inicial." 
    end

    @meses = [["Janeiro",1],
    ["Fevereiro",2],
    ["Março",3],
    ["Abril",4],
    ["Maio",5],
    ["Junho",6],
    ["Julho",7],
    ["Agosto",8],
    ["Setembro",9],
    ["Outubro",10],
    ["Novembro",11],
    ["Dezembro",12]]

    #r = Role.find_by(nome: "ADMINISTRADOR") MUDAR PRA DESENVOLVIMENTO
    #r = Role.find_by(nome: "NUINFO")

    @na_data = Ocorrencia.all.no_periodo(@data_inicial, @data_fim).reverse
    @ocorrencias = @na_data

    if !params[:escola].blank?
      @escola = params[:escola]
      @na_escola = @ocorrencias.na_escola(@escola).all
      @ocorrencias = @na_escola
    end

    if !params[:tipo].blank?
      @tipo = params[:tipo]
      @do_tipo = @ocorrencias.do_tipo(@tipo).all
      @ocorrencias = @do_tipo
    end
    
  end

  def nao_autorizado
  end
end
