require 'immutabler'

dir  = File.dirname(__FILE__)

state_dir = ("#{dir}/State")
actions_dir = ("#{dir}/Actions")
models_dir = ("#{dir}/Models")

Immutabler.group :TDAToDoStoreActions do
    output_dir(actions_dir)
    prefix('TDA')
    base_model('TEBaseAction')
    link_to :TEBaseAction
    link_to :TDAToDoItem
    
    model :OnToDoItemInsert do
        fields do
            prop :text, :string
        end
    end
    
    model :OnToDoItemDelete do
        fields do
            prop :item, :TDAToDoItem
        end
    end
    
    model :OnToDoItemUpdate do
        fields do
            prop :item, :TDAToDoItem
        end
    end
    
    model :OnToDoItemMarkAsDone do
        fields do
            prop :item, :TDAToDoItem
        end
    end
end

Immutabler.group :TDAToDoStoreState do
    output_dir(state_dir)
    prefix('TDA')
    base_model('TEBaseState')
    link_to :TEBaseState

    model :ToDoStoreState do
        fields do
            prop :items, :NSArray
        end
    end
end

Immutabler.group :TDAToDoItem do
    output_dir(models_dir)
    prefix('TDA')
    
    model :ToDoItem do
        fields do
            prop :uuid, :string
            prop :text, :string
            prop :isDone, :bool
            prop :createdAt, :NSDate
        end
    end    
end