class ControleAlocacoesController < ApplicationController
  def index
    # @alocacoes_grid = initialize_grid(ControleAlocacao.all.joins(:recebedor,:entregador).select('colaboradores.nome as nome_recebedor, colaboradores.nome as nome_entregador, *'),
    @alocacoes_grid = initialize_grid(ControleAlocacao.all,
      order: 'id',
      name: 'u1',
      :csv_file_name => "alocacoes_#{Time.now.strftime('%d%m%y%H%M%S')}")
    export_grid_if_requested('u1' => 'grid') do
    end
  end

  def itens
    @alocacao = ControleAlocacao.find_by(id: params[:controle_id])
    @itens_grid = initialize_grid(@alocacao.bens_alocacao,
      name: 'u2',
      :csv_file_name => "itens_#{Time.now.strftime('%d%m%y%H%M%S')}")
    export_grid_if_requested('u2' => 'grid_itens') do
    end
  end
end
