module ApplicationHelper
	def titulo(titulo)
    html = ""
    html += "<h3>#{titulo}</h3>"
    content_for :titulo do
      raw(html)
    end
  end

  def link_icone(texto)
    case texto
	    when 'detalhes'
	      html="<span class='glyphicon glyphicon-eye-open'></span>"

	    when 'editar'
	      html="<span class='glyphicon glyphicon-pencil'></span>"

	    when 'apagar'
	      html="<span class='glyphicon glyphicon-trash'></span>"

	    when 'excluir'
	      html="<span class='glyphicon glyphicon-trash'></span>"

	    when 'remover'
	      html="<span class='glyphicon glyphicon-trash'></span>"

	    when 'desativar'
	      html="<span class='glyphicon glyphicon-remove'></span>"

	    when 'salvar'
	      html="<span class='glyphicon glyphicon-hdd'></span> Salvar"

	    when 'voltar'
	      html="<span class='glyphicon glyphicon-arrow-left'></span>"

	    when 'cancelar'
	      html="<span class='glyphicon glyphicon-refresh'></span> Cancelar"

	    when 'resetar'
	      html="<span class='glyphicon glyphicon-repeat'></span>"

	    when 'novo'
	      html="<span class='glyphicon glyphicon-plus'></span>"

	    when 'nova'
	      html="<span class='glyphicon glyphicon-plus'></span>"

	    when 'adicionar'
	      html="<span class='glyphicon glyphicon-plus'></span> Adicionar"

	    when 'ativar'
	      html="<span class='glyphicon glyphicon-ok'></span>"

	    when 'pegar'
	      html="<span class='glyphicon glyphicon-smile-o'></span> Tornar-se Responsável"

	    when 'setar'
	      html="<span class='glyphicon glyphicon-reply-all'></span> Setar Tecnico"

	    when 'gerenciar'
	      html="<span class='glyphicon glyphicon-cog'></span> Gerenciar"

	    when 'trilhos'
	      html="<span class='glyphicon glyphicon-cog'></span> Trilhos"

	    when 'relatorios'
	      html="<span class='glyphicon glyphicon-folder-open'></span> Relatórios"

	    when 'enviar'
	      html="<i class='icon-share-alt'</span> Enviar"

	    when 'receber'
	      html="<span class='glyphicon glyphicon-icon-arrow-down'></span> Receber"
	    
	  end
	  
	  return raw(html)
	end

	def link_icone2(texto,texto2)
    case texto
	    when 'detalhes'
	      html="<span class='glyphicon glyphicon-eye-open'></span> "
	      html+= texto2

	    when 'editar'
	      html="<span class='glyphicon glyphicon-pencil'></span> "
	      html+= texto2

	    when 'apagar'
	      html="<span class='glyphicon glyphicon-trash'></span> "
	      html+= texto2

	    when 'excluir'
	      html="<span class='glyphicon glyphicon-trash'></span> "
	      html+= texto2

	    when 'remover'
	      html="<span class='glyphicon glyphicon-trash'></span> "
	      html+= texto2

	    when 'desativar'
	      html="<span class='glyphicon glyphicon-remove'></span> "
	      html+= texto2

	    when 'salvar'
	      html="<span class='glyphicon glyphicon-hdd'></span> "
	      html+= texto2

	    when 'voltar'
	      html="<span class='glyphicon glyphicon-arrow-left'></span> "
	      html+= texto2

	    when 'cancelar'
	      html="<span class='glyphicon glyphicon-refresh'></span> "
	      html+= texto2

	    when 'resetar'
	      html="<span class='glyphicon glyphicon-repeat'></span> "
	      html+= texto2

	    when 'novo'
	      html="<span class='glyphicon glyphicon-plus'></span> "
	      html+= texto2

	    when 'nova'
	      html="<span class='glyphicon glyphicon-plus'></span> "
	      html+= texto2

	    when 'adicionar'
	      html="<span class='glyphicon glyphicon-plus'></span> "
	      html+= texto2

	    when 'ativar'
	      html="<span class='glyphicon glyphicon-ok'></span> "
	      html+= texto2

	    when 'pegar'
	      html="<span class='glyphicon glyphicon-smile-o'></span> "
	      html+= texto2

	    when 'setar'
	      html="<span class='glyphicon glyphicon-reply-all'></span> "
	      html+= texto2

	    when 'gerenciar'
	      html="<span class='glyphicon glyphicon-cog'></span> "
	      html+= texto2

	    when 'trilhos'
	      html="<span class='glyphicon glyphicon-cog'></span> "
	      html+= texto2

	    when 'relatorios'
	      html="<span class='glyphicon glyphicon-folder-open'></span> "
	      html+= texto2

	    when 'enviar'
	      html="<i class='icon-share-alt'</span> "
	      html+= texto2

	    when 'receber'
	      html="<span class='glyphicon glyphicon-icon-arrow-down'></span> "
	      html+= texto2
	    
	  end
	  
	  return raw(html)
	end

	def data_br(objeto)
	  if objeto	!= ""
	  	data = "#{objeto.day}/#{objeto.month}/#{objeto.year}"
	    return raw(data)
	  else
	    return raw("")
	  end
	end

	def hora_br(objeto)
	  if objeto	!= ""
	  	hora = objeto.to_s(:time)
	  	return raw(hora)
	  else
	    return raw("Nada Cadastrado")
	  end
	end

	def detalhes(objeto)
	  if !objeto.blank?
	    return raw(objeto)
	  else
	    return raw("Nada Cadastrado")
	  end
	end

	def simnao(objeto)
	  if objeto	!= true
	    return raw('NÃO')
	  else
	    return raw("SIM")
	  end
	end

	def detalhes2(objeto,atributo)
	  if !objeto.nil? 
	    return objeto.send("#{atributo.to_s}")
	  else
	    return raw("Nada Cadastrado")
	  end
	end

	def icone_permissao(texto)
		html = ""
		case texto
			when 'MASTER'
				html+="MT "

			when 'ADMINISTRADOR'
				html+="AD "

			when 'ESCOLA'
				html+="ESC "

			when 'ORGAO'
				html+="ORG "

			

		end

		return raw(html)

	end

end
