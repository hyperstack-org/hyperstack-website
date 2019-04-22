class HomePage < HyperComponent

  before_mount do
    @active_example = 0
    @next_example = "HTML DSL"
    @prev_example = "Serverless & RPC"
  end

  render do
    DIV() do
      DIV(class: :gradient) do

        Mui.Grid(:container,alignContent: :stretch, direction: :column, justify: :center, alignItems: :center, spacing: 40) do
          BR()
          Mui.Grid(:item, xs: 12) do
            AppMenu()
          end
        end

        Mui.Toolbar() do

          DIV(className: 'right') do
            IFRAME(class: 'github',
                   src: 'https://ghbtns.com/github-btn.html?user=hyperstack-org&repo=hyperstack&type=watch&count=true',
                   frameBorder: '0', scrolling: '0', width: '100', height: '20')

          end
        end

        BR(){}
        BR(){}

        MastHead()

        BR {}
        BR {}


        BR {}
        BR {}
        BR {}
        DIV(class: 'text-center space-left space-right') do
          Mui.Grid(container:true ,alignContent: :stretch, direction: :row, justify: :center, alignItems: :center, spacing: 40) do
            three_columns_of_text
          end
        end
      end

      DIV(class: :grey) do

        BR {}
        BR {}
        BR {}
        DIV(class: 'anchor'){}
        BR {}
        BR {}
      end
      DIV(class: 'white-background') do

        DIV(id: :appear) do
          case @active_example
            when 0
              LiveCodeSegment(key: :HELLO_WORLD_EXAMPLE, content: simple_components, code: HELLO_WORLD_EXAMPLE)
            when 1
              LiveCodeSegment(key: :STYLISH_COMPONENT,content: html_dsl, code: STYLISH_COMPONENT)
            when 2
              LiveCodeSegment(key: :STATE_EXAMPLE, content: stateful_components, code: STATE_EXAMPLE)
            when 3
              LiveCodeSegment(key: :JAVASCRIPT_COMPONENTS,content: javascript_in_ruby, code: JAVASCRIPT_COMPONENTS)
            when 4
              LiveCodeSegment(key: :SERVERLESS,content: serverless, code: SERVERLESS)
          end
        end

        DIV(class: 'text-center space-left space-right') do
          Mui.Button(variant: :contained, color: :secondary) {"previous: #{@prev_example}"}.on(:click) do
            @active_example > 0 ? @active_example -=1 : @active_example = 4
            handle_button
          end
          Mui.Button(variant: :contained, color: :secondary) {"next: #{@next_example}"}.on(:click) do
            @active_example < 4 ? @active_example +=1 : @active_example = 0
            handle_button
          end

        # Mui.MobileStepper(
        #     variant: "progress",
        #     steps: 6,
        #     position: "static"
        # # ,
        # #     'nextButton': lambda {Mui.Button(size: "small") {'next'}}
        # #     backButton: lambda {Mui.Button(size: "small") {'next'}.to_n}
        # ) { Mui.Button(size: "small") {'next'} }

        #   <MobileStepper
        #   variant="progress"
        #   steps={6}
        #   position="static"
        #   activeStep={this.state.activeStep}
        #   className={classes.root}
        #   nextButton={
        #       <Button size="small" onClick={this.handleNext} disabled={this.state.activeStep === 5}>
        #       Next
        #   {theme.direction === 'rtl' ? <KeyboardArrowLeft /> : <KeyboardArrowRight />}
        #   </Button>
        # }
        # backButton={
        #   <Button size="small" onClick={this.handleBack} disabled={this.state.activeStep === 0}>
        #     {theme.direction === 'rtl' ? <KeyboardArrowRight /> : <KeyboardArrowLeft />}
        #     Back
        #   </Button>
        #   }
        #   />
        end

        BR {}
        BR {}
        BR {}
        DIV(class: 'text-center') do
          IFRAME( width:"560", height:"315", src:"https://www.youtube.com/embed/GEe7hHIhyUs", frameborder:"0",
                  allow:"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen: true)
        end

        BR {}
        BR {}

        Sem.Image(src: '/images/logos-gray.png', size: :large, centered: true)

        BR {}
        BR {}
        DIV(class: 'text-center') do
          Mui.Button(variant: :contained, color: :secondary) {"Get started with Hyperstack on Rails in under 5 minutes" }.
              on(:click) { `window.open('https://github.com/hyperstack-org/hyperstack/tree/edge/install', "_blank");` }
        end
        BR {}
      end


      AppFooter()

    end
  end

  def handle_button
    `var element_to_scroll_to = $('.anchor')[0];`
    `element_to_scroll_to.scrollIntoView();`
    `$("#appear").css("opacity", "0");`

    case @active_example
    when 0 # "simple components"
      @prev_example = "Serverless & RPC"
      @next_example = "HTML DSL"
    when 1 # "HTML DSL"
      @prev_example = "simple components"
      @next_example = "STATEFUL components"
    when 2 # "STATEFUL components"
      @prev_example = "HTML DSL"
      @next_example = "Bridging Ruby and JavaScript"
    when 3 # "Bridging Ruby and JavaScript"
      @prev_example = "STATEFUL components"
      @next_example = "Serverless & RPC"
    when 4 # "Serverless & RPC"
      @prev_example = "Bridging Ruby and JavaScript"
      @next_example = "simple components"
    end

    mutate @active_example
  end

  def container_default
    {container:true ,alignContent: :stretch, direction: :column, justify: :center, alignItems: :center, spacing: 40}
  end

  def item(n)
    {item: true, xs: n}
  end

  def simple_components

    # LiveCodeSegment(content: content, code: HELLO_WORLD_EXAMPLE)
    DIV do
      Sem.Header(as: :h2, class: 'pink') { "Simple Components" }
        P { 'A Hyperstack user-interface is composed of Components which use a Ruby DSL to describe your HTML.' }
        SPAN { 'Under the covers, we use '}
        A(href: 'https://opalrb.com/', target: "_blank") { 'Opal' }
        SPAN { ' to compile your Ruby code into ' }
        A(href: 'https://reactjs.org/', target: "_blank") { 'React' }
        SPAN {' Components.' }
    end.as_node

  end

  def html_dsl
    # LiveCodeSegment(content: content, code: STYLISH_COMPONENT  )
    DIV do
    Sem.Header(as: :h2, class: 'pink') { "HTML DSL" }
      P { "The Hyperstack Component DSL lets you code in Ruby so you don't have to learn a new templating language like ERB or JSX." }
      P { "The state, logic, classes and styles describing your HTML is concisely described by Ruby classes." }
      P { "Notice that HTML elements like BUTTON and DIV are in CAPS. This is so that they are easily distinguished from other Ruby methods, and don't pollute your application's namespace" }
    end.as_node
  end

  def stateful_components
    DIV do
      Sem.Header(as: :h2, class: 'pink') { "Stateful Components" }
      P { "In Hyperstack you write code in a declarative way with Components that manage their own state." }
      P { "As State changes, React works out how to render the user interface without you having to worry about the DOM." }
      P { "State is held in any instance variable. To alert React to a state change use the mutate method. This will cause a rerender of parts of the display depending on that state." }
      P { "Because state is simply Ruby instance data any Ruby class can become a state store, removing the need for complex flux loops, reducers, and subscriber functions." }
    end.as_node
  end

  def javascript_in_ruby
    DIV do
      Sem.Header(as: :h2, class: 'pink') { "Bridging Ruby and JavaScript" }
      P { "Hyperstack gives you full access to the entire universe of JavaScript libraries and components directly within your Ruby code." }
      P { "Everything you can do in JavaScript is simple to do in Ruby; this includes passing parameters between Ruby and Javascript and even passing Ruby methods as JavaScript callbacks." }
      STRONG { 'There is no need to learn Javascript' }
      SPAN {', all you need to understand is how to bridge between JS and Ruby.'}
      BR()
      BR()
      SPAN { "This website is built with " }
      SPAN { A(href: 'https://react.semantic-ui.com/', target: "_blank") { 'Semantic UI React' } }
      SPAN { ' which we import as our Sem object.' }
      BR()
      BR()
      SPAN { "Notice how we used " }
      SPAN { A(href: 'https://www.npmjs.com/package/react-datepicker', target: "_blank") { 'React DatePicker' } }
      SPAN { " (which is a React.JS component) as if it were a Ruby class and also see how we used `backticks` to jump into native Javascript to use " }
      A(href: 'https://momentjs.com/', target: "_blank") { 'moment.js' }
    end.as_node
  end

  def serverless
    DIV do
      Sem.Header(as: :h2, class: 'pink') { "Serverless & RPC" }
      P { "Making HTTP requests is straightforward in Hyperstack." }
      SPAN { "In this example, we are calling a function on " }
      SPAN { A(href: 'https://faastruby.io/', target: "_blank") { 'FaaStRuby' } }
      SPAN { ' which is a new serverless platform built for Ruby developers.' }
      BR()
      BR()
      P { 'Calling any REST-based API is precisely the same process (although you are likely to put your HTTP calls in a before_mount lifecycle method).' }
      P { 'Notice how HTTP.get returns a promise which executes the block only when it returns.' }
    end.as_node
  end

  def three_columns_of_text
        Mui.Grid(:item, xs: 12, sm: 10, md: 4) do
          H2(class: 'pink-text') do
            Sem.Icon(name: 'diamond', size: :big)
            DIV { 'Isomorphic' }
          end
          P(class: 'light-grey-text') do
            SPAN { 'One language. One model. One set of tests.' }
            SPAN { 'The same business logic and domain Models are running on the clients and the server. You have unfettered access to the complete universe of JavaScript libraries (including React) from within your Ruby code.' }
          end
        end

        Mui.Grid(:item, xs: 12, sm: 10, md: 4) do
          H2(class: 'yellow-text') do
            Sem.Icon(name: 'code', size: :big)
            DIV { 'Fast' }
          end
          P(class: 'light-grey-text') { 'Build interactive Web applications quickly. Hyperstack encourages rapid development with clean, pragmatic design. With developer productivity as our highest goal, Hyperstack takes care of much of the hassle of Web development.' }
        end

        Mui.Grid(:item, xs: 12, sm: 10, md: 4) do
          H2(class: 'light-grey-text') do
            Sem.Icon(name: 'code branch', size: :big)
            DIV { 'Open Source' }
          end
          DIV(class: 'light-grey-text') do
            SPAN { 'Hyperstack is open source software (MIT license), so not only is it free to use, you can also help make it better. See the ' }
            A { 'Contributing Guidelines' }.on(:click) { `window.open('https://github.com/hyperstack-org/hyperstack/blob/edge/CONTRIBUTING.md', "_blank");` }
            SPAN { ' and ' }
            A { 'Roadmap' }.on(:click) { `window.open('https://github.com/hyperstack-org/hyperstack/blob/edge/ROADMAP.md', "_blank");` }
            SPAN { ' for ways in which you can help.' }
          end
        end
  end

  def get_started
    Sem.Grid(celled: false, columns: 1) do
      Sem.GridRow { }
      Sem.GridRow do
        Sem.GridColumn do
           Sem.Image(src: '/images/logos-gray.png', size: :large, centered: true)
        end
      end
      Sem.GridRow do
        Sem.GridColumn(textAlign: :center) do
          Sem.Button(primary: true, size: :huge, basic: false) { "Get started with Hyperstack on Rails in under 5 minutes" }.on(:click) do
            # AppStore.history.push '/edge/docs/installation/installation'
            `window.open('https://github.com/hyperstack-org/hyperstack/tree/edge/install', "_blank");`
          end
        end
      end
    end
    Sem.Divider(hidden: true)
    Sem.Divider(hidden: true)
  end
end
