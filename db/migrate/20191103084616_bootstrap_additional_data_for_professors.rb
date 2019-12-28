class BootstrapAdditionalDataForProfessors < ActiveRecord::Migration[5.2]
  def change
    # Load data
    professors_data_file = File.read('db/seeds/professors/professors.json')
    professors_data = JSON.parse(professors_data_file)

    # Generate FuzzyMatcher based on external data
    processed_data = {}
    professors_data.each do |prof|
        processed_data[prof['node_title']] = prof
    end
    fz = FuzzyMatch.new(processed_data.keys)

    # Get existing professors
    professors = {}
    Professor.all.each { |prof| professors[prof.name] = prof }
    professors.keys.each do |prof|
      result_name = fz.find(prof)
      professors[prof].update(additional_data: processed_data[result_name])
    end
  end
end
