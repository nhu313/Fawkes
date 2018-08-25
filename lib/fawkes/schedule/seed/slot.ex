defmodule Fawkes.Schedule.Seed.Slot do
  @moduledoc false

  alias Fawkes.Repo
  alias Fawkes.Schedule.Slot

  def perform do
    Enum.each(data(), fn attrs ->
      %Slot{}
      |> Slot.changeset(attrs)
      |> Repo.insert!()
    end)
  end

  def data do
    [
      %{
        slug: "slot_1",
        start_time: "2018-09-06 07:00:00",
        end_time: "2018-09-06 08:30:00"
        },
      %{
        slug: "slot_2",
        start_time: "2018-09-06 08:30:00",
        end_time: "2018-09-06 08:45:00"
      },
      %{
        slug: "slot_3",
        start_time: "2018-09-06 08:45:00",
      end_time: "2018-09-06 09:45:00"
      },
      %{
        slug: "slot_4",
        start_time: "2018-09-06 09:45:00",
      end_time: "2018-09-06 10:15:00"
      },
      %{
        slug: "slot_5",
        start_time: "2018-09-06 10:15:00",
      end_time: "2018-09-06 10:55:00"
      },
      %{
        slug: "slot_6",
        start_time: "2018-09-06 11:00:00",
      end_time: "2018-09-06 11:40:00"
      },
      %{
        slug: "slot_7",
        start_time: "2018-09-06 11:40:00",
      end_time: "2018-09-06 13:00:00"
      },
      %{
        slug: "slot_8",
        start_time: "2018-09-06 13:00:00",
      end_time: "2018-09-06 13:40:00"
      },
      %{
        slug: "slot_9",
        start_time: "2018-09-06 13:45:00",
      end_time: "2018-09-06 14:25:00"
      },
      %{
        slug: "slot_a",
        start_time: "2018-09-06 14:25:00",
      end_time: "2018-09-06 15:00:00"
      },
      %{
        slug: "slot_b",
        start_time: "2018-09-06 15:00:00",
      end_time: "2018-09-06 15:40:00"
      },
      %{
        slug: "slot_c",
        start_time: "2018-09-06 15:45:00",
      end_time: "2018-09-06 16:25:00"
      },
      %{
        slug: "slot_d",
        start_time: "2018-09-06 16:25:00",
      end_time: "2018-09-06 16:45:00"
      },
      %{
        slug: "slot_e",
        start_time: "2018-09-06 16:45:00",
      end_time: "2018-09-06 18:15:00"
      },
      %{
        slug: "slot_f",
        start_time: "2018-09-07 08:00:00",
      end_time: "2018-09-07 08:50:00"
      },
      %{
        slug: "slot_g",
        start_time: "2018-09-07 08:50:00",
      end_time: "2018-09-07 09:05:00"
      },
      %{
        slug: "slot_h",
        start_time: "2018-09-07 09:05:00",
      end_time: "2018-09-07 10:05:00"
      },
      %{
        slug: "slot_i",
        start_time: "2018-09-07 10:05:00",
      end_time: "2018-09-07 10:35:00"
      },
      %{
        slug: "slot_j",
        start_time: "2018-09-07 10:35:00",
      end_time: "2018-09-07 11:15:00"
      },
      %{
        slug: "slot_k",
        start_time: "2018-09-07 11:20:00",
      end_time: "2018-09-07 12:00:00"
      },
      %{
        slug: "slot_l",
        start_time: "2018-09-07 12:00:00",
      end_time: "2018-09-07 13:30:00"
      },
      %{
        slug: "slot_m",
        start_time: "2018-09-07 13:30:00",
      end_time: "2018-09-07 14:10:00"
      },
      %{
        slug: "slot_n",
        start_time: "2018-09-07 14:15:00",
      end_time: "2018-09-07 14:55:00"
      },
      %{
        slug: "slot_o",
        start_time: "2018-09-07 14:55:00",
      end_time: "2018-09-07 15:30:00"
      },
      %{
        slug: "slot_p",
        start_time: "2018-09-07 15:30:00",
      end_time: "2018-09-07 16:10:00"
      },
      %{
        slug: "slot_q",
        start_time: "2018-09-07 16:15:00",
      end_time: "2018-09-07 16:55:00"
      },
      %{
        slug: "slot_r",
        start_time: "2018-09-07 16:55:00",
      end_time: "2018-09-07 17:15:00"
      },
      %{
        slug: "slot_s",
        start_time: "2018-09-07 17:15:00",
      end_time: "2018-09-07 17:30:00"
      },
      %{
        slug: "slot_t",
        start_time: "2018-09-07 17:30:00",
      end_time: "2018-09-07 18:30:00"
      }
    ]
  end
end
