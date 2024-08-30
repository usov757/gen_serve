defmodule MyMqttTest do
  use ExUnit.Case
  doctest MyMqtt

  test "greets the world" do
    assert MyMqtt.hello() == :world
  end
end
