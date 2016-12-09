class LocacoesController < ApplicationController
  def index
    @locacoes_grid = initialize_grid(Locacao.all,
      order: 'id',
      name: 'u1',
      :csv_file_name => "locacoes_#{Time.now.strftime('%d%m%y%H%M%S')}")
    export_grid_if_requested('u1' => 'grid') do
    end
  end

  def materiais
    @locacao = Locacao.find_by(id: params[:locacao_id])
    @materiais_grid = initialize_grid(@locacao.locacao_materiais,
      name: 'u2',
      :csv_file_name => "materiais_#{Time.now.strftime('%d%m%y%H%M%S')}")
    export_grid_if_requested('u2' => 'grid_materiais') do
    end
  end
end
