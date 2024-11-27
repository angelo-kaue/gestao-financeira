defmodule FinancasWeb.ReceitaHTML do
  use FinancasWeb, :html

  # Carrega os templates
  embed_templates "receita_html/*"

  @doc """
  Renders a receita form.
  """
  def receita_form(assigns) do
    ~H"""
    <form action={@action} method="post">
      <div>
        <label>Descrição</label>
        <input type="text" name="receita[descricao]" value={@changeset.changes.descricao || ""}/>
      </div>
      <div>
        <label>Valor</label>
        <input type="number" step="0.01" name="receita[valor]" value={@changeset.changes.valor || ""}/>
      </div>
      <div>
        <label>Data</label>
        <input type="date" name="receita[data]" value={@changeset.changes.data || ""}/>
      </div>
      <button type="submit">Salvar</button>
    </form>
    """
  end
end
