class HomePage < Hyperloop::Router::Component
  render do
    DIV() do
      Sem.Container(fluid: true) do
        # AppMenu(section: 'home')
        MastHead()

        Sem.Divider(hidden: true)
        Sem.Container(textAlign: :center, class: 'block') { three_columns_of_text }
        Sem.Divider()

        Sem.Container() do
          simple_components
          html_dsl
          stateful_components
          javascript_in_ruby
          get_started
        end

        AppFooter()
        SearchResultModal(history: history)
      end
    end
  end

  def simple_components
    content = DIV do
      Sem.Header(size: :medium, class: 'pink') { "Simple Components" }
      P { "As with React, a Hyperstack user-interface is composed of Components which mix conditional logic and HTML elements." }
      P { "Under the covers, we use Opal to compile your Ruby code into JavaScript then hand it to React to mount as a regular JavaScript React Component." }
    end.as_node

    LiveCodeSegment(content: content, code: HELLO_WORLD_EXAMPLE)
  end

  def html_dsl
    content = DIV do
      Sem.Header(size: :medium, class: 'pink') { "HTML DSL" }
      P { "Conditional logic, HTML elements, state and style all intermingle in a Hyperstack Component." }
      P { "Notice that the HTML elements (BUTTON, DIV, etc.) are in CAPS. We know this is bending the standard Ruby style rules slightly, but we think it reads better this way." }
      P { "You can specify the CSS class on any HTML element." }
      P { "We think the Ruby DSL is a lot nicer to work with than ERB or JSX!" }
    end.as_node

    LiveCodeSegment(content: content, code: STYLISH_COMPONENT  )
  end

  def stateful_components
    content = DIV do
      Sem.Header(size: :medium, class: 'pink') { "Stateful Components" }
      P { "In Hyperstack you write code in a declarative way with Components that manage their own State." }
      P { "As State changes, React works out how to render the user interface without you having to worry about the DOM." }
      P { "To reference State we use state.foo and to mutate (change it) we use mutate.foo" }
      P { "State is shared between Components via a Store, which you can read about in the DSL docs." }
    end.as_node

    LiveCodeSegment(content: content, code: STATE_EXAMPLE)
  end

  def javascript_in_ruby
    content = DIV do
      Sem.Header(size: :medium, class: 'pink') { "Bridging Ruby and JavaScript" }
      P { "Hyperstack gives you full access to the entire universe of JavaScript libraries and components directly within your Ruby code." }
      # P { "Everything you can do in JavaScript is simple to do in Ruby, this includes passing parameters between Ruby and JavaScript and even passing Ruby methods as JavaScript callbacks!" }
      P { "Notice how we used DatePicker (which is a React.JS component) as if it were a Ruby class and also see how we used `backticks` to jump into native Javascript." }
    end.as_node

    LiveCodeSegment(content: content, code: JAVASCRIPT_COMPONENTS)
  end

  def three_columns_of_text
    Sem.Grid(columns: 3, textAlign: :center) do

      Sem.GridColumn do
        H2(class: 'ui icon header') do
          IMG(class: 'ui icon image', src: 'images/icons/code.png')
          'Isomorphic'
        end
        P do
          SPAN { 'One language. One model. One set of tests.' }
          SPAN { 'The same business logic and domain Models are running on the clients and the server. You have unfettered access to the complete universe of JavaScript libraries (including React) from within your Ruby code.' }
        end
      end

      Sem.GridColumn do
        H2(class: 'ui icon header') do
          IMG(class: 'ui icon image', src: 'images/icons/code-signs-in-rounded-square-interface-symbol.png')
          'Fast'
        end
        P { 'Build interactive Web applications quickly. Hyperstack encourages rapid development with clean, pragmatic design. With developer productivity as our highest goal, Hyperstack takes care of much of the hassle of Web development.' }
      end

      Sem.GridColumn do
        H2(class: 'ui icon header') do
          # IMG(class: 'ui icon image', src: 'images/icons/molecule.png')
          Sem.Icon(name: 'code branch')
          'Open Source'
        end
        BR()
        SPAN { 'Hyperstack is open source software (MIT license), so not only is it free to use, you can also help make it better. See the ' }
        A { 'Contributing Guildlines' }.on(:click) { `window.open('https://github.com/hyperstack-org/hyperstack/blob/edge/CONTRIBUTING.md', "_blank");` }
        SPAN { ' and ' }
        A { 'ROADMAP' }.on(:click) { `window.open('https://github.com/hyperstack-org/hyperstack/blob/edge/ROADMAP.md', "_blank");` }
        SPAN { ' for ways in which you can help.' }
      end
    end
  end

  def get_started
    Sem.Grid(celled: false, columns: 1) do
      Sem.GridRow { }
      Sem.GridRow do
        Sem.GridColumn do
           Sem.Image(src: '/images/logos.png', size: :huge, centered: true)
        end
      end
      Sem.GridRow do
        Sem.GridColumn(textAlign: :center) do
          Sem.Button(primary: true, size: :large, basic: true) { "Create a Hyperstack Rails app in under 5 minutes!" }.on(:click) do
            # params.history.push '/edge/docs/installation/installation'
            `window.open('https://github.com/hyperstack-org/hyperstack/tree/edge/install', "_blank");`
          end
        end
      end
    end
    Sem.Divider(hidden: true)
    Sem.Divider(hidden: true)
  end
end