class AddJournalReferenceToPublication < ActiveRecord::Migration
  def change
    add_reference :publications, :journal, index: true
  end
end
