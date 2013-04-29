module ApplicationHelper

  def talk_id(speaker, event)
    string = speaker ? speaker : event
    string = if string
      string.downcase.tr(' ', '_').tr('&','n')
    else
      "no_id"
    end
    string
  end
end
