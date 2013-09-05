class VocabulariesController < ApplicationController
  before_action :set_vocabulary, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :edit, :create, :index, :show]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Project", :projects_path
  add_breadcrumb "Vocabularies", :project_vocabularies_path


  def index
    @vocabularies = @project.vocabularies
  end

  def show
  end

  def new
    @vocabulary = Vocabulary.new
  end

  def edit
  end

  def create
    @vocabulary = @project.vocabularies.build(vocabulary_params)

    respond_to do |format|
      if @vocabulary.save
        format.html { redirect_to project_vocabularies_path, notice: 'Vocabulary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vocabulary }
      else
        format.html { render action: 'new' }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vocabulary.update(vocabulary_params)
        format.html { redirect_to project_vocabularies_path, notice: 'Vocabulary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vocabulary.destroy
    respond_to do |format|
      format.html { redirect_to project_vocabularies_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocabulary
      @vocabulary = Vocabulary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vocabulary_params
      params.require(:vocabulary).permit(:title)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
