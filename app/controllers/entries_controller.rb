class EntriesController < ApplicationController
  def index
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    if entry.save
      flash.notice = 'Entry created'
      redirect_to entry_path(entry)
    else
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if entry.update_attributes(entry_params)
      flash.notice = 'Entry saved'
      redirect_to entry_path(entry)
    else
      render action: :new
    end
  end

private
  def entry
    @entry ||= Entry.find(params[:id])
  end
  helper_method :entry

  def entries
    @entries ||= Entry.all
  end
  helper_method :entries

  def entry_params
    params.require(:entry).permit(:term, :definition)
  end

end
