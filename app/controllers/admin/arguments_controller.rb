module Admin
  class ArgumentsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Argument.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    def find_resource(param)
      Argument.friendly.find(param)
    end

    def hide
      argument.hide!
      redirect_to :back
    end

    def unhide
      argument.unhide!
      redirect_to :back
    end
    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    private
      def argument
        Argument.friendly.find(params[:slug] || params[:id])
      end
  end
end
