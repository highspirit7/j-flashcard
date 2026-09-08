import { fsrs, Rating as FsrsRating, type Card } from "ts-fsrs";

/**
 * 카드 평가 결과입니다.
 *
 * - again: 기억하지 못함
 * - hard: 어렵게 기억함
 * - good: 무난하게 기억함
 * - easy: 쉽게 기억함
 */
export type Rating = "again" | "hard" | "good" | "easy";

/** 스케줄러에 전달할 카드 평가 정보입니다. */
export interface ScheduleInput {
  card: Card;
  rating: Rating;
}

/** 스케줄러가 계산한 다음 복습 일정입니다. */
export interface ScheduleResult {
  card: Card;
}

/**
 * 카드 평가 시점과 평가 결과를 바탕으로 다음 복습 일정을 계산합니다.
 *
 * @param input 사용자가 선택한 카드 평가
 * @param ratingTime 사용자가 카드를 평가한 시각
 * @returns 계산된 다음 복습 예정 시각
 */
const scheduler = (input: ScheduleInput, ratingTime: Date): ScheduleResult => {
  const ratings = {
    again: FsrsRating.Again,
    hard: FsrsRating.Hard,
    good: FsrsRating.Good,
    easy: FsrsRating.Easy,
  } as const;

  const scheduled = fsrs().next(input.card, ratingTime, ratings[input.rating]);

  return { card: scheduled.card };
};

export default scheduler;
