import { describe, it, expect } from "vitest";
import { createEmptyCard, State } from "ts-fsrs";
import scheduler from "./scheduler";

describe("scheduleCard", () => {
  it("새 카드를 good으로 평가하면 다음 복습 시각이 미래인 새 카드를 반환한다", () => {
    const ratingTime = new Date("2026-09-05T09:00:00.000Z");
    const card = createEmptyCard(ratingTime);
    const result = scheduler({ card, rating: "good" }, ratingTime);

    expect(result.card.due.getTime()).toBeGreaterThan(ratingTime.getTime());
  });

  it("새 카드를 again으로 평가하면 learning 상태의 카드를 반환한다", () => {
    const ratingTime = new Date("2026-09-05T09:00:00.000Z");
    const card = createEmptyCard(ratingTime);
    const result = scheduler({ card, rating: "again" }, ratingTime);

    expect(result.card.state).toBe(State.Learning);
    expect(result.card.due.getTime()).toBeGreaterThan(ratingTime.getTime());
  });

  it("새 카드를 hard으로 평가하면 다음 복습 시각이 미래인 새 카드를 반환한다", () => {
    const ratingTime = new Date("2026-09-05T09:00:00.000Z");
    const card = createEmptyCard(ratingTime);
    const result = scheduler({ card, rating: "hard" }, ratingTime);

    expect(result.card.due.getTime()).toBeGreaterThan(ratingTime.getTime());
  });

  it("새 카드를 easy으로 평가하면 다음 복습 시각이 미래인 새 카드를 반환한다", () => {
    const ratingTime = new Date("2026-09-05T09:00:00.000Z");
    const card = createEmptyCard(ratingTime);
    const result = scheduler({ card, rating: "easy" }, ratingTime);

    expect(result.card.due.getTime()).toBeGreaterThan(ratingTime.getTime());
  });

  it("새 카드의 hard, good, easy 평가는 순서대로 더 늦은 복습 시각을 만든다", () => {
    const ratingTime = new Date("2026-09-05T09:00:00.000Z");
    const hardResult = scheduler(
      { card: createEmptyCard(ratingTime), rating: "hard" },
      ratingTime,
    );
    const goodResult = scheduler(
      { card: createEmptyCard(ratingTime), rating: "good" },
      ratingTime,
    );
    const easyResult = scheduler(
      { card: createEmptyCard(ratingTime), rating: "easy" },
      ratingTime,
    );

    expect(hardResult.card.due.getTime()).toBeLessThan(
      goodResult.card.due.getTime(),
    );
    expect(goodResult.card.due.getTime()).toBeLessThan(
      easyResult.card.due.getTime(),
    );
  });
});
