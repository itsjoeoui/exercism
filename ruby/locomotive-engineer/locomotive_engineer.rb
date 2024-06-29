class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(_each_wagons_id, _missing_wagons)
    first, second, third, *rest = _each_wagons_id

    [third, *_missing_wagons, *rest, first, second]
  end

  def self.add_missing_stops(_route, **_stops)
    { **_route, stops: _stops.values }
  end

  def self.extend_route_information(_route, _more_route_information)
    { **_route, **_more_route_information }
  end
end
