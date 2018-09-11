class MastHead < Hyperloop::Component
  render(DIV) do
    Sem.Segment(inverted: true) do
      Sem.Grid(columns: 4, padded: true) do
        Sem.GridColumn(width: 2)
        Sem.GridColumn(width: 3) { DIV(class: 'hyperlooplogo') }
        Sem.GridColumn(width: 9) do
          P(class: 'project-header') { "Hyperstack" }
          P(class: 'project-tagline') { "Full-stack, interactive, web applications in Ruby" }
         end
        Sem.GridColumn(width: 2)
      end
    end
  end
end